// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../reset_password_view.dart';
import 'pinput_field.dart';
import 'resent_otp_widget.dart';

class VerifyOtpForm extends StatefulWidget {
  const VerifyOtpForm({super.key});

  @override
  State<VerifyOtpForm> createState() => _VerifyOtpFormState();
}

class _VerifyOtpFormState extends State<VerifyOtpForm> {
  bool otpIsComplete = false;

  @override
  Widget build(BuildContext context) {
    // var prov = context.watch<AuthProvider>();
    return Column(
      children: [
        SizedBox(height: 24),
        Text('أدخل رقم ال PIN', style: AppTextStyles.style16w700(context)),
        SizedBox(height: 24),
        PinputField(
          // controller: prov.otpController,
          onChanged: (value) {
            otpIsComplete = value.length == 4;
            setState(() {});
          },
        ),
        SizedBox(height: 24),
        ResentOtpWidget(),
        Spacer(),
        AbsorbPointer(
          absorbing: !otpIsComplete,
          child: Opacity(
            opacity: otpIsComplete ? 1 : 0.5,
            child: CustomButton(
              onPressed: () async {
                // await prov.verifyOTP();
                // if (prov.checkVerifyOTP == true) {
                Navigator.of(
                  context,
                ).pushReplacementNamed(ResetPasswordView.routeName);
                // } else {
                //   DialogHelper.showErrorDialog(
                //     context,
                //     title: 'خطأ',
                //     desc: prov.message,
                //   );
                // }
              },
            ),
          ),
        ),
      ],
    );
  }
}
