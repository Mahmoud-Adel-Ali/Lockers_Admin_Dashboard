import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/dialog_helper.dart';

Future<dynamic> editLockerDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'تعديل بيانات الخزينة',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.5,
        ),
        child: const EditLockerForm(),
      );
    },
  );
}

class EditLockerForm extends StatelessWidget {
  const EditLockerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            const SizedBox(),
            CustomTextFormField(hintText: 'رقم الخزينة'),
            CustomDropdownTextField(
              hintText: 'حجم ال locker',
              items: ['Small', 'Medium', 'Large'],
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'إضافة',
              onPressed: () {
                Navigator.pop(context);
                DialogHelper.showSuccessDialog(
                  context,
                  title: 'تم',
                  desc: 'تم تعديل الخزينة بنجاح',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
