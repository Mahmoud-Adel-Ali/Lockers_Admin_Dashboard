import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../change_location_view.dart';
import 'change_password_dialog.dart';
import '../../../../../core/widgets/profile_text_field.dart';

Future<dynamic> companyProfileDataDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'بيانات الحساب',
        message: '',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 75,
              child: Image.asset(Assets.imagesTestUserImage),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  ProfileTextField(
                    title: 'إسم الشركة :',
                    controller: TextEditingController(
                      text: 'شركة نون التجارية',
                    ),
                    readOnly: true,
                  ),
                  ProfileTextField(
                    title: 'إسم مسؤل الإدارة :',
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
                  const LocationAndPasswordFields(),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class LocationAndPasswordFields extends StatelessWidget {
  const LocationAndPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ChangeLocationView.routeName);
          },
          child: AbsorbPointer(
            child: ProfileTextField(
              controller: TextEditingController(
                text: 'مصر - القاهرة - حي الزيتون',
              ),
              readOnly: true,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.imagesGoogleMap, height: 24),
              ),
            ),
          ),
        ),
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
