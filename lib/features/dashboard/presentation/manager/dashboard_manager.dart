import 'package:flutter/material.dart';

import '../../data/enums/dashboard_type.dart';

class DashboardManager extends ChangeNotifier {
  // Manage view with his type
  DashboardType type = DashboardType.Home;

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
