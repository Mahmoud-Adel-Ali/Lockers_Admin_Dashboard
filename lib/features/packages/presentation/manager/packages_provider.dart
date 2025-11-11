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
    message = '';
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
}
