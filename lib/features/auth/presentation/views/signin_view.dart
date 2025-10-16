import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
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
        image: Assets.imagesSigninBackground,
        showArrow: false,
        form: const SigninForm(),
      ),
    );
  }
}
