import 'package:flutter/foundation.dart';

import '../../../../core/models/places_model.dart';
import '../../../../core/models/unit_model.dart';
import '../../data/repos/units_repo.dart';

class UnitsProvider extends ChangeNotifier {
  UnitsRepo repo = UnitsRepo();

  String message = "";
  // Get All Regions
  List<CityModel> cities = [];

  bool? checkGettingAllRegions = false;
  Future<void> getAllRegions() async {
    checkGettingAllRegions = null;
    message = '';
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
        message = model.message;
      },
    );
    notifyListeners();
  }

  // Get All Units
  List<UnitModel> allUnitsList = [];
  List<UnitModel> filteredUnits = [];
  bool? checkGettingAllUnits = false;

  Future<void> getAllUnits() async {
    checkGettingAllUnits = null;
    message = '';
    notifyListeners();

    final response = await repo.getAllUnits();
    response.fold(
      (msg) {
        checkGettingAllUnits = false;
        message = msg;
      },
      (model) {
        allUnitsList = model.data;
        checkGettingAllUnits = true;
        message = model.message;
        selectedCity = 0;
        selectedRegion = -1;
        filterUnits();
      },
    );
    notifyListeners();
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
}
