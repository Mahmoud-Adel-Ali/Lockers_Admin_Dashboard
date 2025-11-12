import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/functions/pick_image.dart';
import '../../../../core/models/location_details_model.dart';
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

  //* Add Company
  // Company Image
  XFile? image;
  void pickCompanyImage() async {
    image = await pickImage();
    notifyListeners();
  }

  void clearImage() {
    image = null;
    notifyListeners();
  }

  // Controllers & form keys
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var adminNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();

  void clearControllers() {
    nameController.clear();
    adminNameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    passwordConfirmationController.clear();
    locationDetailsModel = null;
    image = null;
  }

  // on pick location from google map
  LocationDetailsModel? locationDetailsModel;

  void onPickLocation(LocationDetailsModel location) {
    locationDetailsModel = location;
    notifyListeners();
  }

  // Add New Company Method
  bool? checkAddNewCompany = false;
  Future<void> addNewCompany() async {
    if (locationDetailsModel == null) {
      message = 'Please Pick Company Location';
      checkAddNewCompany = false;
      notifyListeners();
      return;
    } else if (image == null) {
      message = 'Please Pick Company Image';
      checkAddNewCompany = false;
      notifyListeners();
      return;
    }
    // Loading Stage
    checkAddNewCompany = null;
    message = '';
    notifyListeners();

    final response = await repo.addNewCompany(
      image: image!,
      name: nameController.text,
      adminName: adminNameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
      location: locationDetailsModel!,
    );
    response.fold(
      (msg) {
        message = msg;
        checkAddNewCompany = false;
      },
      (msg) {
        message = msg.message;
        checkAddNewCompany = true;
        getAllCompanies();
      },
    );
    notifyListeners();
  }
}
