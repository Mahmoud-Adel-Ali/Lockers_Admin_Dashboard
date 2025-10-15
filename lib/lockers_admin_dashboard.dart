import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/size_config.dart';
import 'generated/l10n.dart';

class LockersAdminDashboard extends StatelessWidget {
  const LockersAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const Scaffold(),
    );
  }
}
