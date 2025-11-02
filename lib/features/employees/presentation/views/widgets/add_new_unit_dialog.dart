import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/circular_button.dart';
import '../../../../../core/widgets/custom_button.dart';
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

            SizedBox(height: 16),
            CustomButton(
              text: 'إضافة',
              onPressed: () {
                Navigator.pop(context);
                DialogHelper.showSuccessDialog(
                  context,
                  title: 'تم',
                  desc: 'تم اضافة الوحدة بنجاح',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
