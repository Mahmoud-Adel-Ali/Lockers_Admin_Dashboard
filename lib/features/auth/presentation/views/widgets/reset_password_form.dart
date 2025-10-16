// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_password.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomPasswordField(hintText: 'كلمة المرور الجديدة'),
          SizedBox(height: 16),
          CustomPasswordField(hintText: 'تاكيد كلمة المرور الجديدة'),
          SizedBox(height: 16),
          Spacer(),
          CustomButton(
            onPressed: () {
              doneMethod(context);
            },
          ),
        ],
      ),
    );
  }

  void doneMethod(BuildContext context) {
    Navigator.pop(context);
    showSuccessSnackBar(context, msg: 'تم تغيير كلمة المرور بنجاح');
  }
}
