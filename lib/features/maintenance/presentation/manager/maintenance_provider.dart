import 'package:flutter/material.dart';

import '../../../../core/models/places_model.dart';
import '../../../../core/models/unit_model.dart';
import '../../data/models/maintenance_locker_model.dart';
import '../../data/repos/maintenance_repo.dart';

class MaintenanceProvider extends ChangeNotifier {
  MaintenanceRepo repo = MaintenanceRepo();

  String message = '';

  //* Get Regions Of Maintenance Units
  List<CityModel> regionsOfMaintenanceUnits = [];

  bool? checkGetRegionsOfMaintenanceUnits = false;

  Future<void> getRegionsOfMaintenanceUnits() async {
    checkGetRegionsOfMaintenanceUnits = null;
    notifyListeners();

    final response = await repo.getRegionsOfMaintenanceUnits();
    response.fold(
      (msg) {
        checkGetRegionsOfMaintenanceUnits = false;
        message = msg;
      },
      (model) {
        regionsOfMaintenanceUnits = model.data!.cities;
        checkGetRegionsOfMaintenanceUnits = true;
        message = model.message;
      },
    );
    notifyListeners();
  }

  //* Get Regions Of Maintenance Lockers
  List<CityModel> regionsOfMaintenanceLockers = [];

  bool? checkGetRegionsOfMaintenanceLockers = false;

  Future<void> getRegionsOfMaintenanceLockers() async {
    checkGetRegionsOfMaintenanceLockers = null;
    notifyListeners();

    final response = await repo.getRegionsOfMaintenanceLockers();
    response.fold(
      (msg) {
        checkGetRegionsOfMaintenanceLockers = false;
        message = msg;
      },
      (model) {
        regionsOfMaintenanceLockers = model.data!.cities;
        checkGetRegionsOfMaintenanceLockers = true;
        message = model.message;
      },
    );
    notifyListeners();
  }

  //* Get Maintenance Units
  List<UnitModel> maintenanceUnits = [];
  List<UnitModel> filteredMaintenanceUnitsList = [];

  bool? checkGetMaintenanceUnits = false;

  Future<void> getMaintenanceUnits() async {
    selectedUnitsCity = 0;
    selectedUnitsRegion = -1;
    checkGetMaintenanceUnits = null;
    notifyListeners();

    final response = await repo.getMaintenanceUnits();
    response.fold(
      (msg) {
        checkGetMaintenanceUnits = false;
        message = msg;
      },
      (model) {
        maintenanceUnits = model.data;
        checkGetMaintenanceUnits = true;
        message = model.message;
        filterMaintenanceUnits();
      },
    );
    notifyListeners();
  }

  //* Get Maintenance Lockers
  List<MaintenanceLockerModel> maintenanceLockers = [];
  List<MaintenanceLockerModel> filteredMaintenanceLockersList = [];

  bool? checkGetMaintenanceLockers = false;

  Future<void> getMaintenanceLockers() async {
    selectedLockersCity = 0;
    selectedLockersRegion = -1;
    checkGetMaintenanceLockers = null;
    notifyListeners();

    final response = await repo.getMaintenanceLockers();
    response.fold(
      (msg) {
        checkGetMaintenanceLockers = false;
        message = msg;
      },
      (model) {
        maintenanceLockers = model.lockers;
        checkGetMaintenanceLockers = true;
        message = model.message;
        filterMaintenanceLockers();
      },
    );
    notifyListeners();
  }

  //* Filteration the maintenance units by city and neighborhood
  int selectedUnitsCity = 0;
  int selectedUnitsRegion = -1;

  void changeUnitsCity(int cityIndex) {
    selectedUnitsCity = cityIndex;
    selectedUnitsRegion = -1;
    filterMaintenanceUnits();
  }

  void changeUnitsRegion(int regionIndex) {
    selectedUnitsRegion = regionIndex;
    filterMaintenanceUnits();
  }

  // filter units by city and neighborhood
  void filterMaintenanceUnits() {
    if (regionsOfMaintenanceUnits.isEmpty) {
      filteredMaintenanceUnitsList = maintenanceUnits;
      return;
    } else if (selectedUnitsRegion == -1) {
      filteredMaintenanceUnitsList = maintenanceUnits
          .where(
            (element) =>
                element.city ==
                regionsOfMaintenanceUnits[selectedUnitsCity].city,
          )
          .toList();
    } else {
      filteredMaintenanceUnitsList = maintenanceUnits.where((element) {
        return element.city ==
                regionsOfMaintenanceUnits[selectedUnitsCity].city &&
            element.neighborhood ==
                regionsOfMaintenanceUnits[selectedUnitsCity]
                    .neighborhoods[selectedUnitsRegion];
      }).toList();
    }
    notifyListeners();
  }

  //* Filteration the maintenance lockers by city and neighborhood
  int selectedLockersCity = 0;
  int selectedLockersRegion = -1;

  void changeLockersCity(int cityIndex) {
    selectedLockersCity = cityIndex;
    selectedLockersRegion = -1;
    filterMaintenanceLockers();
  }

  void changeLockersRegion(int regionIndex) {
    selectedLockersRegion = regionIndex;
    filterMaintenanceLockers();
  }

  void filterMaintenanceLockers() {
    if (regionsOfMaintenanceLockers.isEmpty) {
      filteredMaintenanceLockersList = maintenanceLockers;
      return;
    } else if (selectedLockersRegion == -1) {
      filteredMaintenanceLockersList = maintenanceLockers
          .where(
            (element) =>
                element.city ==
                regionsOfMaintenanceLockers[selectedLockersCity].city,
          )
          .toList();
    } else {
      filteredMaintenanceLockersList = maintenanceLockers.where((element) {
        return element.city ==
                regionsOfMaintenanceLockers[selectedLockersCity].city &&
            element.neighborhood ==
                regionsOfMaintenanceLockers[selectedLockersCity]
                    .neighborhoods[selectedLockersRegion];
      }).toList();
    }
    notifyListeners();
  }

  //* delete Unit from mantenance
  bool? checkDeleteUnitFromMaintenance = false;

  Future<void> deleteUnitFromMaintenance({required int unitId}) async {
    checkDeleteUnitFromMaintenance = null;
    notifyListeners();
    final response = await repo.deleteUnitFromMaintenance(id: unitId);
    response.fold(
      (msg) {
        checkDeleteUnitFromMaintenance = false;
        message = msg;
      },
      (model) {
        checkDeleteUnitFromMaintenance = true;
        message = model.message;
        getRegionsOfMaintenanceUnits();
        getMaintenanceUnits();
        getMaintenanceLockers();
        getRegionsOfMaintenanceLockers();
      },
    );
    notifyListeners();
  }

  //* delete Locker from mantenance
  bool? checkDeleteLockerFromMaintenance = false;

  Future<void> deleteLockerFromMaintenance({required int lockerId}) async {
    checkDeleteLockerFromMaintenance = null;
    notifyListeners();
    final response = await repo.deleteLockerFromMaintenance(id: lockerId);
    response.fold(
      (msg) {
        checkDeleteLockerFromMaintenance = false;
        message = msg;
      },
      (model) {
        checkDeleteLockerFromMaintenance = true;
        message = model.message;
        getRegionsOfMaintenanceUnits();
        getMaintenanceUnits();
        getMaintenanceLockers();
        getRegionsOfMaintenanceLockers();
      },
    );
    notifyListeners();
  }
}
