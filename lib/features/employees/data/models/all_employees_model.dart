import 'employee_model.dart';

class AllEmployeesModel {
  final bool status;
  final String message;
  final List<EmployeeModel> employees;

  AllEmployeesModel({
    required this.status,
    required this.message,
    required this.employees,
  });

  factory AllEmployeesModel.fromJson(Map<String, dynamic> json) {
    return AllEmployeesModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      employees: (json['data'] as List<dynamic>? ?? [])
          .map((e) => EmployeeModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': employees.map((e) => e.toJson()).toList(),
    };
  }
}
