import 'package:flutter/material.dart';

class SizeConfig {
  SizeConfig._();

  static const double mobile = 500;
  static const double tablet = 900;
  static const double desktop = 1200;

  static late double width, height;

  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    width = size.width;
    height = size.height;
  }

  static bool isMobile() => width < tablet;

  static bool isTablet() => width >= tablet && width < desktop;

  static bool isDesktop() => width >= desktop;
}
