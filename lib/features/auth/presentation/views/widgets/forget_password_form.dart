// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../verify_otp_view.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomPhoneTextField(),
          SizedBox(height: 16),
          Spacer(),
          CustomButton(
            onPressed: () {
              log('=========');
              Navigator.pushReplacementNamed(context, VerifyOtpView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
