import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/circular_button.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_labeled_checkbox.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/dialog_helper.dart';

Future<dynamic> editEmployeeDataDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'تعديل بيانات الموظف',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        child: const EditEmployeeDataForm(),
      );
    },
  );
}

class EditEmployeeDataForm extends StatelessWidget {
  const EditEmployeeDataForm({super.key});

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
                    backgroundImage: AssetImage(Assets.imagesTestUserImage),
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
            CustomTextFormField(
              lable: 'الإسم',
              controller: TextEditingController(text: 'محمدخالد عبدالرازق'),
            ),
            CustomPhoneTextField(
              label: 'رقم الهاتف',
              controller: TextEditingController(text: '+20 0108765243456'),
            ),
            CustomTextFormField(
              lable: 'الإيميل',
              controller: TextEditingController(text: 's4Fp2@example.com'),
            ),
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
              text: 'تعديل',
              onPressed: () {
                Navigator.pop(context);
                DialogHelper.showSuccessDialog(
                  context,
                  title: 'تم',
                  desc: 'تم تعديل بيانات الموظف بنجاح',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
