import 'package:flutter/material.dart';

import '../../../../core/services/hive_services.dart';
import '../../../auth/data/models/admin_data.dart';
import '../../../auth/data/models/permission_model.dart';
import '../../data/enums/dashboard_type.dart';

class DashboardManager extends ChangeNotifier {
  // Manage view with his type
  DashboardType type = DashboardType.Home;

  // init
  bool isAdmin = false;
  AdminData? adminData;
  //
  bool manageUnits = false;
  bool manageCustomers = false;
  bool manageComplaints = false;
  bool manageMaintenance = false;
  bool followReservations = false;
  bool manageShippingCompanies = false;
  //
  void init() {
    adminData = HiveServices.getAdminData();
    if (adminData!.role != 'admin') {
      isAdmin = false;
      getDashboardTypeFromPermissions(adminData!.permissions);
      manageUnits = adminData!.permissions.manageUnits;
      manageCustomers = adminData!.permissions.manageCustomers;
      manageComplaints = adminData!.permissions.manageComplaints;
      manageMaintenance = adminData!.permissions.manageMaintenance;
      followReservations = adminData!.permissions.followReservations;
      manageShippingCompanies = adminData!.permissions.manageShippingCompanies;
    } else {
      type = DashboardType.Home;
      isAdmin = true;
    }
    notifyListeners();
  }

  void getDashboardTypeFromPermissions(PermissionModel permissions) {
    if (permissions.manageShippingCompanies) {
      type = DashboardType.ShippingCompanies;
      return;
    } else if (permissions.manageUnits) {
      type = DashboardType.Units;
      return;
    } else if (permissions.followReservations) {
      type = DashboardType.FollowUpReservations;
      return;
    } else if (permissions.manageCustomers) {
      type = DashboardType.Customers;
      return;
    } else if (permissions.manageComplaints) {
      type = DashboardType.Complaints;
      return;
    } else if (permissions.manageMaintenance) {
      type = DashboardType.Maintenance;
      return;
    }
  }

  void changeView(DashboardType newType) {
    type = newType;
    notifyListeners();
  }

  // To manage drawer open or close
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    drawerKey.currentState?.openDrawer();
    // notifyListeners();
  }

  void closeDrawer() {
    drawerKey.currentState?.closeDrawer();
    // notifyListeners();
  }

  bool isDrawerOpen() => drawerKey.currentState?.isDrawerOpen ?? false;
}
