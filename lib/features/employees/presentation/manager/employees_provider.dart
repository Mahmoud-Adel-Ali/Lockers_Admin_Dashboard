import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/functions/pick_image.dart';
import '../../data/enums/permission_type.dart';
import '../../data/models/employee_model.dart';
import '../../data/models/permissions_model.dart';
import '../../data/repos/employees_repo.dart';

class EmployeesProvider extends ChangeNotifier {
  EmployeesRepo repo = EmployeesRepo();

  String message = '';

  //* Get All Employees
  var searchController = TextEditingController();
  List<EmployeeModel> employees = [];
  List<EmployeeModel> filteredEmployees = [];

  bool? checkGetAllEmployees = false;

  Future<void> getAllEmployees() async {
    checkGetAllEmployees = null;
    notifyListeners();

    final result = await repo.getAllEmployees(search: searchController.text);
    result.fold(
      (msg) {
        message = msg;
        checkGetAllEmployees = false;
      },
      (model) {
        message = model.message;
        checkGetAllEmployees = true;
        employees = model.employees;
        filteredEmployees = employees;
      },
    );
    notifyListeners();
  }

  // Filter Employees
  PermissionType permissionType = PermissionType.all;
  // void filterEmployees({required PermissionType permissionType}) {
  //   this.permissionType = permissionType;
  //   switch (permissionType) {
  //     case PermissionType.all:
  //       filteredEmployees = employees;
  //       break;
  //     case PermissionType.manageShippingCompanies:
  //       filteredEmployees = employees
  //           .where((element) => element.permissions.manageShippingCompanies)
  //           .toList();
  //       break;
  //     case PermissionType.manageUnits:
  //       filteredEmployees = employees
  //           .where((element) => element.permissions.manageUnits)
  //           .toList();
  //       break;
  //     case PermissionType.followReservations:
  //       filteredEmployees = employees
  //           .where((element) => element.permissions.followReservations)
  //           .toList();
  //       break;
  //     case PermissionType.manageCustomers:
  //       filteredEmployees = employees
  //           .where((element) => element.permissions.manageCustomers)
  //           .toList();
  //       break;
  //     case PermissionType.manageComplaints:
  //       filteredEmployees = employees
  //           .where((element) => element.permissions.manageComplaints)
  //           .toList();
  //       break;
  //     case PermissionType.manageMaintenance:
  //       filteredEmployees = employees
  //           .where((element) => element.permissions.manageMaintenance)
  //           .toList();
  //   }
  // }

  final Map<PermissionType, bool Function(EmployeeModel)> permissionMap = {
    PermissionType.manageShippingCompanies: (e) =>
        e.permissions.manageShippingCompanies,
    PermissionType.manageUnits: (e) => e.permissions.manageUnits,
    PermissionType.followReservations: (e) => e.permissions.followReservations,
    PermissionType.manageCustomers: (e) => e.permissions.manageCustomers,
    PermissionType.manageComplaints: (e) => e.permissions.manageComplaints,
    PermissionType.manageMaintenance: (e) => e.permissions.manageMaintenance,
  };

  void filterEmployees({required PermissionType permissionType}) {
    this.permissionType = permissionType;

    if (permissionType == PermissionType.all) {
      filteredEmployees = employees;
    } else {
      final filterFn = permissionMap[permissionType]!;
      filteredEmployees = employees.where(filterFn).toList();
    }
    log(filteredEmployees.length.toString());
    notifyListeners();
  }

  //* Add Employee
  XFile? image;
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var passwordConfirmation = TextEditingController();

  bool manageUnits = false;
  bool manageCustomers = false;
  bool manageComplaints = false;
  bool manageMaintenance = false;
  bool followReservations = false;
  bool manageShippingCompanies = false;

  void pickEmployeeImage() async {
    image = await pickImage();
    notifyListeners();
  }

  void clearImage() {
    image = null;
    notifyListeners();
  }

  void changePermissions({
    bool? manageUnits,
    bool? manageCustomers,
    bool? manageComplaints,
    bool? manageMaintenance,
    bool? followReservations,
    bool? manageShippingCompanies,
  }) {
    this.manageUnits = manageUnits ?? this.manageUnits;
    this.manageCustomers = manageCustomers ?? this.manageCustomers;
    this.manageComplaints = manageComplaints ?? this.manageComplaints;
    this.manageMaintenance = manageMaintenance ?? this.manageMaintenance;
    this.followReservations = followReservations ?? this.followReservations;
    this.manageShippingCompanies =
        manageShippingCompanies ?? this.manageShippingCompanies;
    notifyListeners();
  }

  void clearAllData() {
    image = null;
    name.clear();
    phone.clear();
    email.clear();
    password.clear();
    passwordConfirmation.clear();
    manageUnits = false;
    manageCustomers = false;
    manageComplaints = false;
    manageMaintenance = false;
    followReservations = false;
    manageShippingCompanies = false;
    notifyListeners();
  }

  //* Add New Employee
  bool? checkAddEmployee = false;
  Future<void> addNewEmployee() async {
    checkAddEmployee = null;
    notifyListeners();

    EmployeeModel employee = EmployeeModel(
      name: name.text,
      phone: phone.text,
      email: email.text,
      image: '', // not yet uploaded
      password: password.text,
      passwordConfirmation: passwordConfirmation.text,
      permissions: PermissionsModel(
        manageUnits: manageUnits,
        manageCustomers: manageCustomers,
        manageComplaints: manageComplaints,
        manageMaintenance: manageMaintenance,
        followReservations: followReservations,
        manageShippingCompanies: manageShippingCompanies,
      ),
    );

    final response = await repo.addNewEmployee(
      image: image,
      employee: employee,
    );

    response.fold(
      (msg) {
        checkAddEmployee = false;
        message = msg;
      },
      (model) {
        checkAddEmployee = true;
        message = model.message;
        getAllEmployees();
      },
    );
    notifyListeners();
  }
}
