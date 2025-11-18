import 'package:flutter/foundation.dart';

import '../../../../core/models/places_model.dart';
import '../../../../core/models/unit_model.dart';
import '../../../../core/models/user_model.dart';
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
    getUnitDetails();
  }

  //* Get All Order Unit Details
  List<UserModel> usersList = [];
  List<UserModel> filterdUsersList = [];

  int currentIdx = 0;
  void filterUsers({
    bool showAll = false,
    bool showAllUsrs = false,
    bool showShippingOrder = false,
  }) {
    if (showAllUsrs) {
      currentIdx = 1;
      filterdUsersList = usersList.where((user) {
        return user.company == null;
      }).toList();
    } else if (showShippingOrder) {
      currentIdx = 2;
      filterdUsersList = usersList.where((user) {
        return user.company != null;
      }).toList();
    } else {
      currentIdx = 0;
      filterdUsersList = usersList;
    }
    notifyListeners();
  }

  // Get Unit Details
  bool? checkGettingUnitDetails = false;
  Future<void> getUnitDetails() async {
    currentIdx = 0;
    checkGettingUnitDetails = null;
    notifyListeners();
    final response = await repo.getUnitDetails(id: selectedUnit!.id);
    response.fold(
      (msg) {
        checkGettingUnitDetails = false;
        message = msg;
      },
      (model) {
        checkGettingUnitDetails = true;
        selectedUnit = model.data;
        usersList = model.data?.users ?? [];
        filterUsers(showAll: true);
      },
    );
    notifyListeners();
  }
}
