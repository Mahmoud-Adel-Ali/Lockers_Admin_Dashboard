import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../../../core/models/places_model.dart';
import '../../../../core/models/unit_model.dart';
import '../../../units/data/models/order_model.dart';
import '../../data/enum/unit_customer_type.dart';
import '../../data/repos/reservations_repo.dart';

class ReservationsProvider extends ChangeNotifier {
  ReservationsRepo repo = ReservationsRepo();

  String message = "";
  // Get All Regions
  List<CityModel> cities = [];

  bool? checkGettingAllRegions = false;
  Future<void> getAllRegions() async {
    checkGettingAllRegions = null;
    notifyListeners();

    final response = await repo.getAllRegions();
    response.fold(
      (msg) {
        checkGettingAllRegions = false;
        message = msg;
      },
      (model) {
        cities = model.data!.cities;
        checkGettingAllRegions = true;
        filterUnits();
      },
    );
    notifyListeners();
  }

  // Get All Units
  List<UnitModel> allUnitsList = [];
  List<UnitModel> filteredUnits = [];
  bool? checkGettingAllUnits = false;

  Future<void> getAllUnits() async {
    selectedCity = 0;
    selectedRegion = -1;

    checkGettingAllUnits = null;
    notifyListeners();

    final response = await repo.getAllUnits();
    response.fold(
      (msg) {
        checkGettingAllUnits = false;
        message = msg;
        notifyListeners();
      },
      (model) {
        allUnitsList = model.data;
        checkGettingAllUnits = true;
        allUnitsList = model.data;
        filterUnits();
      },
    );
  }

  // Filteration the units by city and neighborhood
  int selectedCity = 0;
  int selectedRegion = -1;

  void changeCity(int cityIndex) {
    selectedCity = cityIndex;
    selectedRegion = -1;
    filterUnits();
  }

  void changeRegion(int regionIndex) {
    selectedRegion = regionIndex;
    filterUnits();
  }

  // filter units by city and neighborhood
  void filterUnits() {
    if (cities.isEmpty) {
      return;
    } else if (selectedRegion == -1) {
      filteredUnits = allUnitsList
          .where((element) => element.city == cities[selectedCity].city)
          .toList();
    } else {
      filteredUnits = allUnitsList.where((element) {
        return element.city == cities[selectedCity].city &&
            element.neighborhood ==
                cities[selectedCity].neighborhoods[selectedRegion];
      }).toList();
    }
    notifyListeners();
  }

  //* On Select Unit
  UnitModel? selectedUnit;
  void onSelectUnit(UnitModel unit) {
    selectedUnit = unit;

    // Reset Pagination Values
    currentPage = 1;
    lastPage = 1;

    // Get Unit Details
    getUnitDetails();
  }

  //* Get All Order Unit Details
  // int currentIdx = 0;
  UnitCustomerType unitCustomerType = UnitCustomerType.all;
  List<OrderModel> unitOrders = [];
  List<OrderModel> filterdUnitOrders = [];
  // For Pagination
  int currentPage = 1;
  int lastPage = 1;

  // next page
  void nextPage() {
    if (currentPage == lastPage) return;
    currentPage += 1;
    getUnitDetails();
  }

  // previous page
  void previousPage() {
    if (currentPage == 1) return;
    currentPage -= 1;
    getUnitDetails();
  }

  void filterUnitOrders({UnitCustomerType? type}) {
    unitCustomerType = type ?? unitCustomerType;
    currentPage = 1;
    getUnitDetails();
  }

  // Get Unit Details
  bool? checkGettingUnitDetails = false;
  Future<void> getUnitDetails() async {
    checkGettingUnitDetails = null;
    notifyListeners();
    final response = await repo.getUnitDetails(
      id: selectedUnit!.id,
      page: currentPage,
      unitCustomerType: unitCustomerType,
    );
    response.fold(
      (msg) {
        checkGettingUnitDetails = false;
        message = msg;
      },
      (model) {
        checkGettingUnitDetails = true;
        unitOrders = model.data.orders;
        filterdUnitOrders = unitOrders;
        currentPage = model.data.currentPage;
        lastPage = model.data.lastPage;
      },
    );
    notifyListeners();
  }

  //* For Show order details view
  //* On Select Order
  OrderModel? selectedOrder;
  void onSelectOrder(OrderModel order) {
    selectedOrder = order;
    log("Selected Order: ${selectedOrder.toString()}");
    notifyListeners();
  }
}
