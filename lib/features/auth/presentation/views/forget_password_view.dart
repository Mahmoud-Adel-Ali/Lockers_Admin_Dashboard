import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/assets.dart';
import '../manager/auth_provider.dart';
import 'widgets/custom_auth_view_body.dart';
import 'widgets/forget_password_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = 'forget-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthViewBody(
        title: 'إعادة تعيين كلمة المرور',
        isLoading: context.watch<AuthProvider>().checkForgetPassword == null,
        image: Assets.imagesForget1Background,
        form: const ForgetPasswordForm(),
      ),
    );
  }
}
