import 'dart:io' show Directory;

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../constants.dart';
import '../api/api_keys.dart';

/// Initializes Hive safely for all platforms and then opens all required boxes in parallel.
///
/// This function must be called before using any Hive functionality.
///
/// It is recommended to call this function in the main() function of your application.
///
/// The function will open all required boxes that are used by the application.
///
Future<void> openHiveBoxes() async {
  // ✅ Initialize Hive safely for all platforms
  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    final Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
  }

  // ✅ Open all required boxes in parallel
  await Future.wait([
    Hive.openBox<String>(ApiKeys.language),
    Hive.openBox(ApiKeys.adminData),
    Hive.openBox(isLoggedIn),
  ]);
}
