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
}
