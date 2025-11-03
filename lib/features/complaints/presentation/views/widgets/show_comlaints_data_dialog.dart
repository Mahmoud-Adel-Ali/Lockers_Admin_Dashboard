import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/utils/assets.dart';
import 'package:lockers_admin_dashboard/core/widgets/custom_text_form_field.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../core/widgets/profile_text_field.dart';

Future<dynamic> showComplaintDataDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        bottomWidget: Row(
          children: [
            Expanded(child: CustomTextFormField(hintText: 'الرد')),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                DialogHelper.showSuccessDialog(
                  context,
                  title: 'تم',
                  desc: 'تم ارسال الرد بنجاح',
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.main,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Icon(Icons.send, color: AppColors.white),
              ),
            ),
          ],
        ),
        child: const ShowComplaintDataForm(),
      );
    },
  );
}

class ShowComplaintDataForm extends StatelessWidget {
  const ShowComplaintDataForm({super.key});

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
                        'الشكوي: ',
                        style: AppTextStyles.style16w500(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'أواجه مشكلة في إعادة إستخدام ال QR Code , وقد يحتاج المستخدم للاتصال بالمسؤول للحصول على المساعدة  . ',
                          style: AppTextStyles.style16w400(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
