import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/profile_text_field.dart';
import 'profile_password_filed.dart';

Future<dynamic> editProfileDataDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.75,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  CircleAvatar(radius: 75, backgroundColor: AppColors.babyBlue),
                  Positioned(
                    bottom: 16,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.filedGrey,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.main,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 16,
                children: [
                  ProfileTextField(
                    title: 'الإسم :',
                    controller: TextEditingController(
                      text: 'محمدخالد عبدالرازق',
                    ),
                  ),
                  ProfilePasswordFields(),
                  SizedBox(height: 16),
                  CustomButton(
                    text: 'تعديل البيانات',
                    horizontal: 0,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
