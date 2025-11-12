import 'package:flutter/material.dart';

import '../../data/models/company_model.dart';
import '../../data/repos/companies_repo.dart';

class CompaniesProvider extends ChangeNotifier {
  CompaniesRepo repo = CompaniesRepo();

  List<CompanyModel> companies = [];
  var searchCompanyController = TextEditingController();
  String message = '';

  // Get All Companies
  bool? checkGetAllCompanies = false;
  Future<void> getAllCompanies() async {
    // Loading Stage
    checkGetAllCompanies = null;
    notifyListeners();

    final response = await repo.getAllCompanies(
      search: searchCompanyController.text,
    );
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
