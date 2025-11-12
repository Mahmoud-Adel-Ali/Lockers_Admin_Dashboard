import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/widgets/dialog_helper.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_location_from_field.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/views/pick_location_view.dart';

Future<dynamic> editUnitDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'تعديل بيانات الوحدة',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.5,
        ),
        child: const AddNewUnitForm(),
      );
    },
  );
}

class AddNewUnitForm extends StatelessWidget {
  const AddNewUnitForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            const SizedBox(),
            CustomTextFormField(hintText: 'رقم الوحدة'),
            CustomLocationFormFied(
              hintText: 'موقع الشركة',
              onTap: () {
                Navigator.of(context).pushNamed(PickLocationView.routeName);
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'تعديل',
              onPressed: () {
                Navigator.pop(context);
                DialogHelper.showSuccessDialog(
                  context,
                  title: 'تم',
                  desc: 'تم التعديل بنجاح',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
