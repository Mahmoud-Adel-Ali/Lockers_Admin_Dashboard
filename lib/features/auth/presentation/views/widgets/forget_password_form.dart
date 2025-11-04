// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../manager/auth_provider.dart';
import '../verify_otp_view.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AuthProvider>();
    return Form(
      key: prov.formKey,
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomPhoneTextField(controller: prov.phoneController),
          SizedBox(height: 16),
          Spacer(),
          CustomButton(
            onPressed: () async {
              if (prov.formKey.currentState!.validate()) {
                prov.formKey.currentState!.save();
                await prov.forgetPassword();
                if (prov.checkForgetPassword == true) {
                  Navigator.pushReplacementNamed(
                    context,
                    VerifyOtpView.routeName,
                  );
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
}
