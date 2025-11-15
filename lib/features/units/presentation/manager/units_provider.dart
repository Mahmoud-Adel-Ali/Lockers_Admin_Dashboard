import 'package:flutter/foundation.dart';

import '../../../../core/enum/locker_size.dart';
import '../../../../core/models/location_details_model.dart';
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
    checkGettingAllUnits = null;
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

  //* On Select Unit
  UnitModel? selectedUnit;
  void onSelectUnit(UnitModel unit) {
    selectedUnit = unit;
    getUnitDetails();
  }

  //* Get Unit Details
  bool? checkGettingUnitDetails = false;
  Future<void> getUnitDetails() async {
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
        message = model.message;
      },
    );
    notifyListeners();
  }

  //* Send Unit to mantenance
  bool? checkSendingUnitToMantenance = false;
  Future<void> sendUnitToMantenance({required int id}) async {
    checkSendingUnitToMantenance = null;
    notifyListeners();
    final response = await repo.sendUnitToMaintenance(id: id);
    response.fold(
      (msg) {
        checkSendingUnitToMantenance = false;
        message = msg;
      },
      (model) {
        checkSendingUnitToMantenance = true;
        message = model.message;
        getAllUnits();
      },
    );
    notifyListeners();
  }

  //* Sent Locker to maintenance
  bool? checkSendingLockerToMantenance = false;
  Future<void> sendLockerToMantenance({required int id}) async {
    checkSendingLockerToMantenance = null;
    notifyListeners();
    final response = await repo.sendLockerToMaintenance(id: id);
    response.fold(
      (msg) {
        checkSendingLockerToMantenance = false;
        message = msg;
      },
      (model) {
        checkSendingLockerToMantenance = true;
        message = model.message;
        getUnitDetails();
      },
    );
    notifyListeners();
  }

  //* Add Locker to Unit
  bool? checkAddingLockerToUnit = false;
  Future<void> addLockerToUnit({required LockerSize size}) async {
    checkAddingLockerToUnit = null;
    notifyListeners();
    final response = await repo.addLockerToUnit(
      unitId: selectedUnit!.id,
      size: size,
    );
    response.fold(
      (msg) {
        checkAddingLockerToUnit = false;
        message = msg;
      },
      (model) {
        checkAddingLockerToUnit = true;
        message = model.message;
        getUnitDetails();
      },
    );
    notifyListeners();
  }

  //* Update Locker in unit
  bool? checkUpdatingLockerInUnit = false;
  Future<void> updateLockerInUnit({
    required int id,
    required LockerSize size,
  }) async {
    checkUpdatingLockerInUnit = null;
    notifyListeners();
    final response = await repo.updateLockerInUnit(
      lockerId: id,
      unitId: selectedUnit!.id,
      size: size,
    );
    response.fold(
      (msg) {
        checkUpdatingLockerInUnit = false;
        message = msg;
      },
      (model) {
        checkUpdatingLockerInUnit = true;
        message = model.message;
        getUnitDetails();
      },
    );
    notifyListeners();
  }

  //* On Pick Location for Unit [add & update]
  LocationDetailsModel? unitLocation;
  void onPickLocation(LocationDetailsModel location) {
    unitLocation = location;
    notifyListeners();
  }

  //* Add New Unit
  bool? checkAddingNewUnit = false;
  Future<void> addNewUnit() async {
    if (unitLocation == null) {
      message = 'لم يتم تحديد موقع الوحدة بعد';
      checkAddingNewUnit = false;
      notifyListeners();
      return;
    }

    checkAddingNewUnit = null;
    notifyListeners();
    final response = await repo.addNewUnit(location: unitLocation!);
    response.fold(
      (msg) {
        checkAddingNewUnit = false;
        message = msg;
      },
      (model) {
        checkAddingNewUnit = true;
        message = model.message;
        unitLocation = null;
        getAllUnits();
      },
    );
    notifyListeners();
  }

  //* Update Unit
  bool? checkUpdatingUnit = false;
  Future<void> updateUnit({required int id}) async {
    if (unitLocation == null) {
      message = 'لم يتم تحديد موقع جديد للوحدة بعد';
      checkUpdatingUnit = false;
      notifyListeners();
      return;
    }
    checkUpdatingUnit = null;
    notifyListeners();
    final response = await repo.updateUnit(id: id, location: unitLocation!);
    response.fold(
      (msg) {
        checkUpdatingUnit = false;
        message = msg;
      },
      (model) {
        checkUpdatingUnit = true;
        message = model.message;
        unitLocation = null;
        getAllUnits();
      },
    );
    notifyListeners();
  }
}
