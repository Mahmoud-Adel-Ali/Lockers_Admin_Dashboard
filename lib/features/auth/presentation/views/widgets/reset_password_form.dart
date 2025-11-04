// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_password.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../manager/auth_provider.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AuthProvider>();
    return Form(
      key: prov.formKey,
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomPasswordField(
            hintText: 'كلمة المرور الجديدة',
            controller: prov.passwordController,
          ),
          SizedBox(height: 16),
          CustomPasswordField(
            hintText: 'تاكيد كلمة المرور الجديدة',
            controller: prov.passwordConfirmationController,
          ),
          SizedBox(height: 16),
          Spacer(),
          CustomButton(
            onPressed: () async {
              if (prov.formKey.currentState!.validate()) {
                prov.formKey.currentState!.save();
                await prov.resetPassword();
                if (prov.checkResetPassword == true) {
                  doneMethod(context);
                } else {
                  DialogHelper.showErrorDialog(
                    context,
                    title: 'خطأ',
                    desc: prov.message,
                  );
                }
              }
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
