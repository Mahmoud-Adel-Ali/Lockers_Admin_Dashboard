import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/circular_button.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_labeled_checkbox.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_text_password.dart';
import '../../../../../core/widgets/dialog_helper.dart';

Future<dynamic> addNewEmployeeDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'إضافة موظف جديد',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        child: const AddEmployeeeDataForm(),
      );
    },
  );
}

class AddEmployeeeDataForm extends StatelessWidget {
  const AddEmployeeeDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: AppColors.whiteGrey,
                  ),
                  Positioned(
                    bottom: 0,
                    child: CircularButton(
                      child: const Icon(Icons.camera_alt_outlined, size: 15),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(),
            CustomTextFormField(hintText: 'الإسم'),
            CustomPhoneTextField(),
            CustomTextFormField(hintText: 'الإيميل'),
            CustomPasswordField(),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.filedGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'الدور الوظيفي',
                        style: AppTextStyles.style16w400(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomLabeledCheckBox(
                    label: 'إدارة شركات الشحن',
                    initialValue: false,
                    onChanged: (value) {},
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة الوحدات',
                    initialValue: false,
                    onChanged: (value) {},
                  ),
                  CustomLabeledCheckBox(
                    label: 'متابعة الحجوزات',
                    initialValue: false,
                    onChanged: (value) {},
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة العملاء',
                    initialValue: false,
                    onChanged: (value) {},
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة الشكاوي',
                    initialValue: false,
                    onChanged: (value) {},
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة قسم الصيانة',
                    initialValue: false,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'إضافة',
              onPressed: () {
                Navigator.pop(context);
                DialogHelper.showSuccessDialog(
                  context,
                  title: 'تم',
                  desc: 'تم اضافة الموظف بنجاح',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
