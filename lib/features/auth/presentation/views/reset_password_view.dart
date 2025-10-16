import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import 'widgets/custom_auth_view_body.dart';
import 'widgets/reset_password_form.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const routeName = '/reset-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthViewBody(
        title: 'إعادة تعيين كلمة المرور',
        image: Assets.imagesForget3Background,
        form: const ResetPasswordForm(),
      ),
    );
  }
}
