import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import 'widgets/custom_auth_view_body.dart';
import 'widgets/verify_otp_form.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});
  static const String routeName = '/verify-otp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthViewBody(
        title: 'تأكيد أنه أنت ؟',
        image: Assets.imagesForget2Background,
        form: VerifyOtpForm(),
      ),
    );
  }
}
