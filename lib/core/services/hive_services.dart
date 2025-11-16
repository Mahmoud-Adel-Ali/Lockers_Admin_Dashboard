import 'dart:developer';

import 'package:hive/hive.dart';

import '../../constants.dart';
import '../../features/auth/data/models/admin_data.dart';
import '../../features/auth/data/models/permission_model.dart';
import '../api/api_keys.dart';

class HiveServices {
  static var adminBox = Hive.box(ApiKeys.adminData);
  // Save Admin Data
  static void saveAdminData(AdminData data) {
    log("Save Admin Data: ${data.toJson()}");
    if (data.id != 0) adminBox.put(ApiKeys.id, data.id);
    if (data.token.isNotEmpty) adminBox.put(ApiKeys.token, data.token);
    if (data.name.isNotEmpty) adminBox.put(ApiKeys.name, data.name);
    if (data.name.isNotEmpty) {
      adminBox.put(ApiKeys.adminName, data.name);
    }
    if (data.phone.isNotEmpty) adminBox.put(ApiKeys.phone, data.phone);
    if (data.email.isNotEmpty) adminBox.put(ApiKeys.email, data.email);
    if (data.image.isNotEmpty) adminBox.put(ApiKeys.image, data.image);
    adminBox.put(ApiKeys.active, data.active);
    if (data.role.isNotEmpty) adminBox.put(ApiKeys.role, data.role);
    if (data.permissions.toJson().isNotEmpty) {
      adminBox.put(ApiKeys.permissions, data.permissions.toJson());
    }
  }

  /// Get Admin Data
  static AdminData getAdminData() {
    // Get Permissions
    final storedPermissions = adminBox.get(ApiKeys.permissions) ?? {};
    final permissions = PermissionModel.fromJson(
      Map<String, dynamic>.from(storedPermissions),
    );
    var adminData = AdminData(
      id: adminBox.get(ApiKeys.id),
      token: adminBox.get(ApiKeys.token),
      name: adminBox.get(ApiKeys.name),
      phone: adminBox.get(ApiKeys.phone),
      email: adminBox.get(ApiKeys.email),
      image: adminBox.get(ApiKeys.image),
      active: adminBox.get(ApiKeys.active),
      role: adminBox.get(ApiKeys.role),
      permissions: permissions,
    );
    log("Get Admin Data: ${adminData.toJson()}");
    return adminData;
  }

  /// Get only token
  static String? getToken() {
    var hiveBox = Hive.box(ApiKeys.adminData);
    return hiveBox.get(ApiKeys.token);
  }

  /// Clear all  data
  static void clearAdminData() {
    var hiveBox = Hive.box(ApiKeys.adminData);
    hiveBox.clear();
  }

  // set Admin is logged in
  static void setAdminLoggedIn() {
    var hiveBox = Hive.box(isLoggedIn);
    hiveBox.put(isLoggedIn, true);
  }

  // set Admin is logged out
  static void setAdminLoggedOut() {
    var hiveBox = Hive.box(isLoggedIn);
    hiveBox.put(isLoggedIn, false);
  }

  // get Admin is logged in
  static bool isAdminLoggedIn() {
    var hiveBox = Hive.box(isLoggedIn);
    return hiveBox.get(isLoggedIn, defaultValue: false) as bool;
  }
}
