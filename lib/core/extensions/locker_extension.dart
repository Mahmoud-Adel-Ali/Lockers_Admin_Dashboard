import 'package:flutter/material.dart';

extension LockerExtension on int? {
  /// Returns locker count as localized string
  /// Example Arabic: 3 → "3 خزائن"
  /// Example English: 3 → "3 Lockers"
  String toLockerString(BuildContext context) {
    final count = this ?? 0;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    if (isArabic) {
      if (count == 0) return 'لا توجد خزائن';
      if (count == 1) return 'خزينه واحدة';
      if (count == 2) return 'خزينتان';
      if (count >= 3 && count <= 10) return '$count خزائن';
      return '$count خزينه';
    } else {
      if (count == 0) return 'No Lockers';
      if (count == 1) return '1 Locker';
      return '$count Lockers';
    }
  }

  /// Returns locker number as localized string
  /// Example Arabic: 4 → "🗄️ الخزنه #4"
  /// Example English: 4 → "🗄️ Locker #4"
  String toLockerNumberString(BuildContext context, {bool withEmoji = false}) {
    final number = this ?? 0;
    final emoji = withEmoji ? '🗄️ ' : '';
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return isArabic ? '$emojiالخزينه #$number' : '$emoji Locker #$number';
  }

  /// Combines locker number and count in one localized string
  /// Example Arabic: "🗄️ الخزنه #4 - 3 خزائن"
  /// Example English: "🗄️ Locker #4 - 3 Lockers"
  String toLockerInfo(
    BuildContext context, {
    required int? count,
    bool withEmoji = true,
  }) {
    final lockerNumberText = toLockerNumberString(
      context,
      withEmoji: withEmoji,
    );
    final lockerCountText = count.toLockerString(context);
    return '$lockerNumberText - $lockerCountText';
  }
}
