import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/auth/presentation/views/verify_otp_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
    case VerifyOtpView.routeName:
      return MaterialPageRoute(builder: (_) => const VerifyOtpView());
    case ResetPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ResetPasswordView());
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
