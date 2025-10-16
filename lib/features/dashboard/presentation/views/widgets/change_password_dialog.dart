import 'package:flutter/material.dart';

import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_text_password.dart';

Future<void> changePasswordDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return CustomDialog(
        title: 'تعديل كلمة المرور',
        message: '',
        constraints: const BoxConstraints(maxHeight: 400, maxWidth: 500),
        child: Column(
          spacing: 16,
          children: [
            SizedBox(height: 16),
            CustomPasswordField(hintText: 'كلمة المرور الحالية'),
            CustomPasswordField(hintText: 'كلمة المرور الجديدة'),
            CustomPasswordField(hintText: 'تاكيد كلمة المرور الجديدة'),
            SizedBox(height: 16),
            CustomButton(
              onPressed: () {
                Navigator.pop(context);
                showSuccessSnackBar(context, msg: 'تم تغيير كلمة المرور بنجاح');
              },
              text: 'حفظ التغيرات',
            ),
          ],
        ),
      );
    },
  );
}
