import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import 'white_grey_container.dart';

Future<dynamic> addNewAgreementDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'إضافة باقة جديدة',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.7,
        ),
        child: const AddNewAgreementForm(),
      );
    },
  );
}

class AddNewAgreementForm extends StatelessWidget {
  const AddNewAgreementForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            const SizedBox(),
            CustomTextFormField(hintText: 'إسم الباقة'),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  flex: 5,
                  child: CustomTextFormField(hintText: 'عدد الحجوزات'),
                ),
                Expanded(child: WhiteGreyContainer(text: 'حجز')),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  flex: 5,
                  child: CustomTextFormField(hintText: 'سعر الباقة'),
                ),
                Expanded(child: WhiteGreyContainer(text: 'EGP')),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  flex: 5,
                  child: CustomTextFormField(hintText: 'المدة الزمنية'),
                ),
                Expanded(child: WhiteGreyContainer(text: 'أشهر')),
              ],
            ),

            SizedBox(height: 16),
            CustomButton(
              text: 'إضافة',
              onPressed: () {
                Navigator.pop(context);
                DialogHelper.showSuccessDialog(
                  context,
                  title: 'تم',
                  desc: 'تم اضافة الباقة بنجاح',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
