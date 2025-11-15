import 'dart:developer';

import 'package:flutter/material.dart';

import '../../data/enums/permission_type.dart';
import '../../data/models/employee_model.dart';
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
}
