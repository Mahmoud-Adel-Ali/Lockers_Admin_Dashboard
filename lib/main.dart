import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/functions/open_hive_boxes.dart';
import 'core/providers/language_provider.dart';
import 'core/services/service_locator.dart';
import 'features/auth/presentation/manager/auth_provider.dart';
import 'features/companies/presentation/manager/companies_provider.dart';
import 'features/complaints/presentation/manager/complaints_provider.dart';
import 'features/dashboard/presentation/manager/dashboard_manager.dart';
import 'features/dashboard/presentation/manager/profile_provider.dart';
import 'features/packages/presentation/manager/packages_provider.dart';
import 'lockers_admin_dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Get It
  setupServicesLocator();
  // Open Hive Boxes
  await openHiveBoxes();
  runApp(
    MultiProvider(
      providers: [
        //* Core Providers
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => DashboardManager()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        //* Features Providers
        ChangeNotifierProvider(create: (_) => CompaniesProvider()),
        ChangeNotifierProvider(create: (_) => PackagesProvider()),
        ChangeNotifierProvider(create: (_) => ComplaintsProvider()),
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
