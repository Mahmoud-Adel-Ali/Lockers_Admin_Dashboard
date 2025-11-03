import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/utils/assets.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/profile_text_field.dart';

Future<dynamic> showCustomerDataDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        title: 'بيانات حساب العميل',
        child: const ShowCustomerDataForm(),
      );
    },
  );
}

class ShowCustomerDataForm extends StatelessWidget {
  const ShowCustomerDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: AppColors.whiteGrey,
                backgroundImage: AssetImage(Assets.imagesTestUserImage),
              ),
            ),
            const SizedBox(),
            ProfileTextField(
              title: 'الإسم',
              controller: TextEditingController(text: 'محمدخالد عبدالرازق'),
            ),
            ProfileTextField(
              title: 'رقم الهاتف',
              controller: TextEditingController(text: '+20 0108765243456'),
            ),
            ProfileTextField(
              title: 'الإيميل',
              controller: TextEditingController(text: 'mohammed123@gmail.com'),
            ),
            ProfileTextField(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assets.imagesGoogleMap,
                  width: 20,
                  height: 20,
                ),
              ),
              controller: TextEditingController(
                text: 'القاهرة - حي الزمالك - شارع الميرغاب',
              ),
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
                        'صور البطاقة الشخصية ( وجه البطاقة )',
                        style: AppTextStyles.style16w400(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
