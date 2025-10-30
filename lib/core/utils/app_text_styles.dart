import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'size_config.dart';

abstract class AppTextStyles {
  // 12 px
  static TextStyle style12w400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 12),
      fontWeight: FontWeight.w400,
      color: AppColors.phosphorGreen,
    );
  }

  static TextStyle style12w700(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 12),
      fontWeight: FontWeight.w700,
      color: AppColors.phosphorGreen,
    );
  }

  // 14 px
  static TextStyle style14w400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      color: AppColors.phosphorGreen,
    );
  }

  static TextStyle style14w500(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
      color: AppColors.phosphorGreen,
    );
  }

  // 16 px
  static TextStyle style16w400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  static TextStyle style16w500(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  static TextStyle style16w700(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 16),
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }

  // 18 px
  static TextStyle style18w400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 18),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 20 px
  static TextStyle style20w400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 20),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  static TextStyle style20w500(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 20),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  static TextStyle style20w700(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 20),
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }

  // 24 px
  static TextStyle style24w400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 24),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  static TextStyle style24w500(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 24),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  static TextStyle style24w600(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 24),
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  // 32 px
  static TextStyle style32w400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 32),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 40 px
  static TextStyle style40w400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 40),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }
}

double getResponsiveFontsize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * fontSize;

  // Clamp between 75% and 120% of original fontsize
  double lowerLimit = 0.75 * fontSize;
  double upperLimit = 1.2 * fontSize;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  SizeConfig.init(context);
  double width = SizeConfig.width;

  if (width <= SizeConfig.mobile) {
    return width / 400; // Smaller scale for mobile
  } else if (width <= SizeConfig.tablet) {
    return width / 750;
  } else if (width <= SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1500; // Ultra-wide desktop
  }
}
