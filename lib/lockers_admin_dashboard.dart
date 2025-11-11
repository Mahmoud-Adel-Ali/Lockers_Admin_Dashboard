import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'core/functions/on_generate_route.dart';
import 'core/providers/language_provider.dart';
import 'core/services/hive_services.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/size_config.dart';
import 'features/auth/presentation/views/signin_view.dart';
import 'features/dashboard/presentation/views/admin_dashboard_view.dart';
import 'generated/l10n.dart';

class LockersAdminDashboard extends StatelessWidget {
  const LockersAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var langProv = context.watch<LanguageProvider>();
    SizeConfig.init(context);
    bool isLoggedIn = HiveServices.isAdminLoggedIn();
    log("Widht: ${SizeConfig.width}");
    log("Height: ${SizeConfig.height}");
    return MaterialApp(
      title: 'Lockers Admin Dashboard',
      theme: ThemeData(
        primaryColor: AppColors.main,
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: tajawal,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.main),
      ),
      debugShowCheckedModeBanner: false,
      locale: langProv.currentLocale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: isLoggedIn
          ? AdminDashboardView.routeName
          : SigninView.routeName,
    );
  }
}
