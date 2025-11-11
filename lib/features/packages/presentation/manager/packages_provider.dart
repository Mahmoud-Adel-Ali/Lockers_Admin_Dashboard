import 'package:flutter/material.dart';

import '../../data/models/package_model.dart';
import '../../data/repos/packages_repo.dart';

class PackagesProvider extends ChangeNotifier {
  PackagesRepo repo = PackagesRepo();

  List<PackageModel> packages = [];
  String message = '';

  //* Get All Packages
  bool? checkGettingAllPackages = false;

  Future<void> getAllPackages() async {
    // Loading Stage
    checkGettingAllPackages = null;
    notifyListeners();

    final response = await repo.getPackages();
    response.fold(
      (msg) {
        message = msg;
        checkGettingAllPackages = false;
      },
      (model) {
        packages = model.data;
        checkGettingAllPackages = true;
        message = model.message;
      },
    );
    notifyListeners();
  }

  //* On Select Package
  PackageModel? selectedPackage;
  void onSelectPackage(PackageModel model) {
    selectedPackage = model;
    fillControllers(model);
    notifyListeners();
  }

  //* Controller & FormKey
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var countLocker = TextEditingController();
  var price = TextEditingController();
  var duration = TextEditingController();

  //* Fill Controllers for update package
  void fillControllers(PackageModel model) {
    name = TextEditingController(text: model.name);
    countLocker = TextEditingController(text: model.countLocker.toString());
    price = TextEditingController(text: model.price.toString());
    duration = TextEditingController(text: model.duration.toString());
  }

  //* Clear Controllers
  void clearControllers() {
    name.clear();
    countLocker.clear();
    price.clear();
    duration.clear();
  }

  //* Add New Package
  bool? checkAddingNewPackage = false;

  Future<void> addNewPackage() async {
    // Loading Stage
    checkAddingNewPackage = null;
    message = '';
    notifyListeners();
    var newPackage = PackageModel(
      id: 0,
      name: name.text,
      countLocker: int.parse(countLocker.text),
      price: double.parse(price.text),
      duration: int.parse(duration.text),
    );
    final response = await repo.addNewPackage(package: newPackage);
    response.fold(
      (msg) {
        message = msg;
        checkAddingNewPackage = false;
      },
      (model) {
        message = model.message;
        checkAddingNewPackage = true;
        getAllPackages();
        clearControllers();
      },
    );
    notifyListeners();
  }

  //* Update Package
  bool? checkUpdatingPackage = false;

  Future<void> updatePackage() async {
    // Loading Stage
    checkUpdatingPackage = null;
    message = '';
    notifyListeners();
    PackageModel newPackage = PackageModel(
      id: selectedPackage!.id,
      name: name.text,
      countLocker: int.parse(countLocker.text),
      price: double.parse(price.text),
      duration: int.parse(duration.text),
    );

    final response = await repo.updatePackage(package: newPackage);
    response.fold(
      (msg) {
        message = msg;
        checkUpdatingPackage = false;
      },
      (model) {
        message = model.message;
        checkUpdatingPackage = true;
        getAllPackages();
        clearControllers();
      },
    );
    notifyListeners();
  }
}
