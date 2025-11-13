import 'package:flutter/material.dart';

extension UnitStringExtension on int? {
  /// Returns the unit string with proper localization
  /// Example: "الوحدة #4" for Arabic, "Unit #4" for English
  String toUnitString(BuildContext context) {
    final number = this ?? 0;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return isArabic ? 'الوحدة #$number' : 'Unit #$number';
  }
}
