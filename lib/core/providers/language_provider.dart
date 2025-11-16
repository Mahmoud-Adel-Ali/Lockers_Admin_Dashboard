import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../api/api_keys.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _currentLocale;

  LanguageProvider() {
    _loadLanguage();
  }

  Locale get currentLocale => _currentLocale ?? const Locale('ar');

  Future<void> _loadLanguage() async {
    final box = Hive.box<String>(ApiKeys.language);
    final langCode = box.get(ApiKeys.language, defaultValue: 'ar');
    _currentLocale = Locale(langCode!);
    notifyListeners();
  }

  Future<void> changeLanguage(String langCode) async {
    final box = Hive.box<String>(ApiKeys.language);
    await box.put(ApiKeys.language, langCode);
    _currentLocale = Locale(langCode);
    notifyListeners();
  }

  Future<void> toArabic() async => await changeLanguage('ar');

  Future<void> toEnglish() async => await changeLanguage('en');

  bool get isArabic => (_currentLocale?.languageCode ?? 'ar') == 'ar';
}
