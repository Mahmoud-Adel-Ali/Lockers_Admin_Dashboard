import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/signin_view.dart';
import '../services/hive_services.dart';

//* Check if the user is unauthenticated.
//* If the user is unauthenticated,
//* clear the data and set the user as logged out.
void checkUnauthenticated(BuildContext context, {required String msg}) {
  if (msg == 'Unauthenticated') {
    HiveServices.clearAdminData();
    HiveServices.setAdminLoggedOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      SigninView.routeName,
      (_) => false,
    );
  }
}
