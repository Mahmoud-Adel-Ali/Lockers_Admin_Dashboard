// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/convert_location_to_text.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/models/location_details_model.dart';
import '../../../../../core/views/pick_location_view.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_location_from_field.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/units_provider.dart';

Future<dynamic> addNewUnitDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'إضافة وحدة جديدة',
        constraints: BoxConstraints(maxWidth: 400, maxHeight: 300),
        child: const AddNewUnitForm(),
      );
    },
  );
}

class AddNewUnitForm extends StatelessWidget {
  const AddNewUnitForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UnitsProvider>();
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            const SizedBox(),
            // CustomTextFormField(hintText: 'رقم الوحدة'),
            CustomLocationFormFied(
              hintText: 'موقع الوحدة',
              controller: prov.unitLocation == null
                  ? null
                  : TextEditingController(
                      text: convertLocationToText(
                        context,
                        city: prov.unitLocation?.city,
                        neighborhood: prov.unitLocation?.neighborhood,
                        street: prov.unitLocation?.street,
                        buildingNum: prov.unitLocation?.buildingNum,
                      ),
                    ),
              onTap: () async {
                final location = await Navigator.push<LocationDetailsModel>(
                  context,
                  MaterialPageRoute(builder: (_) => const PickLocationView()),
                );

                if (location != null) {
                  prov.onPickLocation(location);
                }
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'إضافة',
              onPressed: () async {
                //* Show Loading Dialog
                showLoadingDialog(context);

                await prov.addNewUnit();

                //* Close Loading Dialog
                Navigator.pop(context);

                if (prov.checkAddingNewUnit == true) {
                  //* Close Dialog
                  Navigator.pop(context);

                  showSuccessSnackBar(context, msg: prov.message);
                } else if (prov.checkAddingNewUnit == false) {
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
        ),
      ),
    );
  }
}
