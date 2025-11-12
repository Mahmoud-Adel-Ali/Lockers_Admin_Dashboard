// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "changeLanguageConfirmation": MessageLookupByLibrary.simpleMessage(
      "Do you want to change the language?",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "language": MessageLookupByLibrary.simpleMessage("English"),
    "location_permission_error_desc": MessageLookupByLibrary.simpleMessage(
      "The app does not have permission to access your location.\n\nPlease grant location permission in your phone settings to enable location features.",
    ),
    "location_permission_error_title": MessageLookupByLibrary.simpleMessage(
      "Location Permission Error",
    ),
    "location_service_error_desc": MessageLookupByLibrary.simpleMessage(
      "It seems that the location service (GPS) is turned off.\n\nPlease enable it from your phone settings and try again.",
    ),
    "location_service_error_title": MessageLookupByLibrary.simpleMessage(
      "Location Service Error",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "the_language": MessageLookupByLibrary.simpleMessage("Language"),
    "unit": MessageLookupByLibrary.simpleMessage("Unit"),
  };
}
