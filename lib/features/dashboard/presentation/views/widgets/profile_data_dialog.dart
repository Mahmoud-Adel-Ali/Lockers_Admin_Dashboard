import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/profile_text_field.dart';
import 'edit_profile_dialog.dart';
import 'profile_password_filed.dart';

Future<dynamic> profileDataDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.9,
        ),
        leading: CustomButton(
          text: 'تعديل البيانات',
          horizontal: 0,
          onPressed: () => editProfileDataDialog(context),
        ),
        child: Column(
          children: [
            Text('بيانات الحساب', style: AppTextStyles.style18w400(context)),
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage(Assets.imagesAppLogo),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  AbsorbPointer(
                    child: Column(
                      spacing: 16,
                      children: [
                        ProfileTextField(
                          title: 'الإسم :',
                          controller: TextEditingController(
                            text: 'محمدخالد عبدالرازق',
                          ),
                          readOnly: true,
                        ),
                        ProfileTextField(
                          title: 'الإيميل :',
                          controller: TextEditingController(
                            text: 'www.noon.ecommerce.gov',
                          ),
                          readOnly: true,
                        ),
                        ProfileTextField(
                          title: 'رقم الهاتف :',
                          controller: TextEditingController(
                            text: '+20 0108765434567',
                          ),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  const ProfilePasswordFields(),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
