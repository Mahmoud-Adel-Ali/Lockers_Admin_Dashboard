import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/service_locator.dart';
import 'features/dashboard/presentation/manager/dashboard_manager.dart';
import 'lockers_admin_dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Get It
  setupServicesLocator();
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
    appWindow.minSize = Size(500, 500);
    appWindow.alignment = Alignment.center;
    appWindow.show();
    appWindow.maximize();
  });
}
