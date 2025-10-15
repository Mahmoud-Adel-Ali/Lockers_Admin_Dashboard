import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'lockers_admin_dashboard.dart';

void main() {
  runApp(const LockersAdminDashboard());

  doWhenWindowReady(() {
    appWindow.minSize = Size(1100, 700);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
