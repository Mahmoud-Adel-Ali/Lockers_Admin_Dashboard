import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/assets.dart';
import '../manager/auth_provider.dart';
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
        isLoading: context.watch<AuthProvider>().checkResetPassword == null,
        image: Assets.imagesForget3Background,
        form: const ResetPasswordForm(),
      ),
    );
  }
}
