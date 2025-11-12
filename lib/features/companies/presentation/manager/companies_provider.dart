import 'package:flutter/material.dart';

import '../../data/models/company_model.dart';
import '../../data/repos/companies_repo.dart';

class CompaniesProvider extends ChangeNotifier {
  CompaniesRepo repo = CompaniesRepo();

  List<CompanyModel> companies = [];
  String message = '';

  // Get All Companies
  bool? checkGetAllCompanies = false;
  Future<void> getAllCompanies() async {
    // Loading Stage
    checkGetAllCompanies = null;
    notifyListeners();

    final response = await repo.getAllCompanies();
    response.fold(
      (msg) {
        message = msg;
        checkGetAllCompanies = false;
      },
      (msg) {
        companies = msg.companies;
        message = msg.message;
        checkGetAllCompanies = true;
      },
    );
    notifyListeners();
  }
}
