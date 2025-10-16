import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/profile_text_field.dart';
import 'change_password_dialog.dart';

Future<dynamic> profileDataDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'بيانات الحساب',
        message: '',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.8,
        ),
        child: Column(
          children: [
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

class ProfilePasswordFields extends StatelessWidget {
  const ProfilePasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        InkWell(
          onTap: () => changePasswordDialog(context),
          child: AbsorbPointer(
            child: ProfileTextField(
              title: 'كلمة المرور :',
              readOnly: true,
              controller: TextEditingController(text: '**********'),
            ),
          ),
        ),
      ],
    );
  }
}
