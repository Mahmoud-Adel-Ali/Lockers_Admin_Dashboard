import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/auth/presentation/views/verify_otp_view.dart';
import '../../features/companies/presentation/views/pick_company_location_view.dart';
import '../../features/dashboard/presentation/views/admin_dashboard_view.dart';
import '../../features/notification/presentation/view/notification_view.dart';

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
    case AdminDashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const AdminDashboardView());
    case NotificationView.routeName:
      return MaterialPageRoute(builder: (_) => const NotificationView());
    case PickCompanyLocationView.routeName:
      return MaterialPageRoute(builder: (_) => const PickCompanyLocationView());

    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
