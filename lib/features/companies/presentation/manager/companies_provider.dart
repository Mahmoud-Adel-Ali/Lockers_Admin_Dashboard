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

  // Company Details
  int companyId = 0;
  CompanyModel? companyDetails;

  void onSelectCompany(CompanyModel company) {
    companyId = company.id;
    getCompanyDetails();
  }

  // Get Company Details
  bool? checkGetCompanyDetails = false;
  Future<void> getCompanyDetails() async {
    // Loading Stage
    message = '';
    checkGetCompanyDetails = null;
    notifyListeners();

    final response = await repo.getCompanyDetails(id: companyId);
    response.fold(
      (msg) {
        message = msg;
        checkGetCompanyDetails = false;
      },
      (model) {
        companyDetails = model.company;
        message = model.message;
        checkGetCompanyDetails = true;
      },
    );
    notifyListeners();
  }
}
