// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language`
  String get the_language {
    return Intl.message('Language', name: 'the_language', desc: '', args: []);
  }

  /// `English`
  String get language {
    return Intl.message('English', name: 'language', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Do you want to change the language?`
  String get changeLanguageConfirmation {
    return Intl.message(
      'Do you want to change the language?',
      name: 'changeLanguageConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unit {
    return Intl.message('Unit', name: 'unit', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Location Service Error`
  String get location_service_error_title {
    return Intl.message(
      'Location Service Error',
      name: 'location_service_error_title',
      desc: '',
      args: [],
    );
  }

  /// `It seems that the location service (GPS) is turned off.\n\nPlease enable it from your phone settings and try again.`
  String get location_service_error_desc {
    return Intl.message(
      'It seems that the location service (GPS) is turned off.\n\nPlease enable it from your phone settings and try again.',
      name: 'location_service_error_desc',
      desc: '',
      args: [],
    );
  }

  /// `Location Permission Error`
  String get location_permission_error_title {
    return Intl.message(
      'Location Permission Error',
      name: 'location_permission_error_title',
      desc: '',
      args: [],
    );
  }

  /// `The app does not have permission to access your location.\n\nPlease grant location permission in your phone settings to enable location features.`
  String get location_permission_error_desc {
    return Intl.message(
      'The app does not have permission to access your location.\n\nPlease grant location permission in your phone settings to enable location features.',
      name: 'location_permission_error_desc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
