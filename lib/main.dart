import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/dashboard/presentation/manager/dashboard_manager.dart';
import 'lockers_admin_dashboard.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardManager()),
        //
      ],
      child: const LockersAdminDashboard(),
    ),
  );

  doWhenWindowReady(() {
    appWindow.minSize = Size(1100, 700);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
