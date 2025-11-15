// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/widgets/dialog_helper.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/convert_location_to_text.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/models/location_details_model.dart';
import '../../../../../core/models/unit_model.dart';
import '../../../../../core/views/pick_location_view.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_location_from_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/units_provider.dart';

Future<dynamic> editUnitDialog(
  BuildContext context, {
  required UnitModel unit,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'تعديل بيانات الوحدة',
        constraints: BoxConstraints(maxWidth: 500, maxHeight: 300),
        child: EditUnitForm(unit: unit),
      );
    },
  );
}

class EditUnitForm extends StatelessWidget {
  const EditUnitForm({super.key, required this.unit});
  final UnitModel unit;
  @override
  Widget build(BuildContext context) {
    log("Unit : ${unit.toJson()}");
    var prov = context.watch<UnitsProvider>();
    var lastUnitLocation = LocationDetailsModel(
      latitude: unit.latitude,
      longitude: unit.longitude,
      city: unit.city,
      neighborhood: unit.neighborhood,
      street: unit.street,
      buildingNum: unit.buildNumber,
      administrativeArea: unit.additionAddress,
    );
    var controller = TextEditingController(
      text: convertLocationToText(
        context,
        city: prov.unitLocation?.city ?? unit.city,
        neighborhood: prov.unitLocation?.neighborhood ?? unit.neighborhood,
        street: prov.unitLocation?.street ?? unit.street,
        buildingNum: prov.unitLocation?.buildingNum ?? unit.buildNumber,
      ),
    );
    return Column(
      spacing: 16,
      children: [
        const SizedBox(),
        // CustomTextFormField(hintText: 'رقم الوحدة'),
        CustomLocationFormFied(
          hintText: 'موقع الوحدة',
          controller: controller,
          onTap: () async {
            final location = await Navigator.push<LocationDetailsModel>(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    PickLocationView(lastLocationModel: lastUnitLocation),
              ),
            );

            if (location != null) {
              prov.onPickLocation(location);
            }
          },
        ),
        SizedBox(height: 16),
        CustomButton(
          text: 'حفظ التغييرات',
          onPressed: () async {
            //* Show Loading Dialog
            showLoadingDialog(context);

            await prov.updateUnit(id: unit.id);

            //* Close Loading Dialog
            Navigator.pop(context);

            if (prov.checkUpdatingUnit == true) {
              //* Close Dialog
              Navigator.pop(context);

              showSuccessSnackBar(context, msg: prov.message);
            } else if (prov.checkUpdatingUnit == false) {
              checkUnauthenticated(context, msg: prov.message);
              DialogHelper.showErrorDialog(
                context,
                title: S.of(context).error,
                desc: prov.message,
              );
            }
          },
        ),
      ],
    );
  }
}
