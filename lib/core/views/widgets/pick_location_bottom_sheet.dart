// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../functions/validation_of_input_fields.dart';
import '../../models/location_details_model.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/profile_text_field.dart';

Future<void> pickLocationDetailsBottomSheet(
  BuildContext context, {
  required LocationDetailsModel locationModel,
}) async {
  final result = await showModalBottomSheet<LocationDetailsModel>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) =>
        PickLocationBottomSheetForm(locationModel: locationModel),
  );

  // If user saved
  if (result != null) {
    // Return result to previous screen
    Navigator.pop(context, result);
  }
}

class PickLocationBottomSheetForm extends StatefulWidget {
  final LocationDetailsModel locationModel;
  const PickLocationBottomSheetForm({super.key, required this.locationModel});

  @override
  State<PickLocationBottomSheetForm> createState() =>
      _PickLocationBottomSheetFormState();
}

class _PickLocationBottomSheetFormState
    extends State<PickLocationBottomSheetForm> {
  var formKey = GlobalKey<FormState>();
  final cityController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final streetController = TextEditingController();
  final buildingController = TextEditingController();
  final administrativeAreaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cityController.text = widget.locationModel.city ?? '';
    neighborhoodController.text = widget.locationModel.neighborhood ?? '';
    streetController.text = widget.locationModel.street ?? '';
    buildingController.text = widget.locationModel.buildingNum ?? '';
    administrativeAreaController.text =
        widget.locationModel.administrativeArea ?? '';
  }

  @override
  void dispose() {
    cityController.dispose();
    neighborhoodController.dispose();
    streetController.dispose();
    buildingController.dispose();
    administrativeAreaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('تفاصيل الموقع', style: AppTextStyles.style16w400(context)),
              ProfileTextField(
                title: 'المدينة :',
                validator: simpleValidator,
                controller: cityController,
              ),
              ProfileTextField(
                title: 'الحي :',
                controller: neighborhoodController,
                validator: simpleValidator,
              ),
              ProfileTextField(
                title: 'الشارع :',
                controller: streetController,
                validator: simpleValidator,
              ),
              ProfileTextField(
                title: 'رقم المبني :',
                controller: buildingController,
                validator: simpleValidator,
              ),
              ProfileTextField(
                title: 'عنوان إضافي :',
                controller: administrativeAreaController,
                // validator: simpleValidator,
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'حفظ',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final result = LocationDetailsModel(
                      latitude: widget.locationModel.latitude,
                      longitude: widget.locationModel.longitude,
                      city: cityController.text,
                      neighborhood: neighborhoodController.text,
                      street: streetController.text,
                      buildingNum: buildingController.text,
                      administrativeArea: administrativeAreaController.text,
                    );
                    Navigator.pop(context, result);
                  }
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
