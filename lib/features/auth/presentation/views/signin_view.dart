import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/assets.dart';
import '../manager/auth_provider.dart';
import 'widgets/custom_auth_view_body.dart';
import 'widgets/signin_form.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthViewBody(
        title: 'تسجيل الدخول',
        isLoading: context.watch<AuthProvider>().checSingin == null,
        image: Assets.imagesSigninBackground,
        showArrow: false,
        form: const SigninForm(),
      ),
    );
  }
}
