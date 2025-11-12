// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
    "changeLanguageConfirmation": MessageLookupByLibrary.simpleMessage(
      "هل ترغب في تغيير اللغة؟",
    ),
    "english": MessageLookupByLibrary.simpleMessage("الإنجليزية"),
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "language": MessageLookupByLibrary.simpleMessage("العربية"),
    "location_permission_error_desc": MessageLookupByLibrary.simpleMessage(
      "التطبيق لا يمتلك إذن الوصول إلى موقعك.\n\nيرجى منح الإذن من إعدادات الهاتف لتفعيل ميزة تحديد الموقع.",
    ),
    "location_permission_error_title": MessageLookupByLibrary.simpleMessage(
      "خطاء في صلاحيات الموقع",
    ),
    "location_service_error_desc": MessageLookupByLibrary.simpleMessage(
      "يبدو أن خدمة تحديد الموقع (GPS) مغلقة.\n\nيرجى تفعيل خدمة الموقع من إعدادات الهاتف ثم المحاولة مرة أخرى.",
    ),
    "location_service_error_title": MessageLookupByLibrary.simpleMessage(
      "خطاء في خدمة الموقع",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("موافق"),
    "the_language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "unit": MessageLookupByLibrary.simpleMessage("الوحده رقم"),
  };
}
