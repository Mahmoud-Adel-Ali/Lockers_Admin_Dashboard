import 'package:flutter/material.dart';

extension CustomersExtension on int? {
  /// Returns customer count as localized string
  /// Example Arabic: 3 → "3 عملاء"
  /// Example English: 3 → "3 Customers"
  String toCustomerString(BuildContext context) {
    final count = this ?? 0;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    if (isArabic) {
      if (count == 0) return 'لا يوجد عملاء';
      if (count == 1) return 'عميل واحد';
      if (count == 2) return 'عميلان';
      if (count >= 3 && count <= 10) return '$count عملاء';
      return '$count عميل';
    } else {
      if (count == 0) return 'No Customers';
      if (count == 1) return '1 Customer';
      return '$count Customers';
    }
  }

  /// Returns customer number as localized string
  /// Example Arabic: 4 → "👤 العميل #4"
  /// Example English: 4 → "👤 Customer #4"
  String toCustomerNumberString(
    BuildContext context, {
    bool withEmoji = false,
  }) {
    final number = this ?? 0;
    final emoji = withEmoji ? '👤 ' : '';
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return isArabic ? '$emojiالعميل #$number' : '$emoji #$number';
  }

  /// Combines customer number and count in one localized string
  /// Example Arabic: "👤 العميل #4 - 3 عملاء"
  /// Example English: "👤 Customer #4 - 3 Customers"
  String toCustomerInfo(
    BuildContext context, {
    required int? count,
    bool withEmoji = true,
  }) {
    final customerNumberText = toCustomerNumberString(
      context,
      withEmoji: withEmoji,
    );
    final customerCountText = count.toCustomerString(context);
    return '$customerNumberText - $customerCountText';
  }
}
