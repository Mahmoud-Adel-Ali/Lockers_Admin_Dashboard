import 'package:flutter/foundation.dart';

import '../../data/models/employee_model.dart';
import '../../data/repos/employees_repo.dart';

class EmployeesProvider extends ChangeNotifier {
  EmployeesRepo repo = EmployeesRepo();

  String message = '';

  //* Get All Employees
  List<EmployeeModel> employees = [];

  bool? checkGetAllEmployees = false;

  Future<void> getAllEmployees() async {
    checkGetAllEmployees = null;
    notifyListeners();

    final result = await repo.getAllEmployees();
    result.fold(
      (msg) {
        message = msg;
        checkGetAllEmployees = false;
      },
      (model) {
        message = model.message;
        checkGetAllEmployees = true;
        employees = model.employees;
      },
    );
    notifyListeners();
  }
}
