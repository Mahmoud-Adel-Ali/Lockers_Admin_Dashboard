import 'package:flutter/foundation.dart';

import '../../data/models/home_dashboard_response.dart';
import '../../data/repos/home_repo.dart';

class HomeProvider extends ChangeNotifier {
  HomeRepo repo = HomeRepo();

  String message = '';

  //* Home Dashboard Data
  int totalLockers = 0;
  int totalUnits = 0;
  int lockersUnderMaintenance = 0;
  int unitsUnderMaintenance = 0;
  CountModel? lockers;
  CountModel? units;

  // OrdersModel orders;
  int year = DateTime.now().year;
  int total = 0;
  List<MonthlyOrders> monthly = [];

  //* Get Home Dashboard Data
  bool? checkGetHomeDashboardData = false;

  getHomeDashboardData() async {
    checkGetHomeDashboardData = null;
    notifyListeners();
    final response = await repo.getHomeDashboardData();
    response.fold(
      (msg) {
        checkGetHomeDashboardData = false;
        message = msg;
      },
      (model) {
        message = model.message;
        checkGetHomeDashboardData = true;
        totalLockers = model.data.totalLockers;
        totalUnits = model.data.totalUnits;
        lockersUnderMaintenance = model.data.lockersUnderMaintenance;
        unitsUnderMaintenance = model.data.unitsUnderMaintenance;
        lockers = model.data.lockers;
        units = model.data.units;
        // orders = model.data.orders;
        year = model.data.orders.year;
        total = model.data.orders.total;
        monthly = model.data.orders.monthly;
      },
    );
    notifyListeners();
  }
}
