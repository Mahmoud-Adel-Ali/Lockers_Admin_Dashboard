import 'permissions_model.dart';

class EmployeeModel {
  final String name;
  final String phone;
  final String email;
  final String? password;
  final String? passwordConfirmation;
  final PermissionsModel permissions;

  EmployeeModel({
    required this.name,
    required this.phone,
    required this.email,
    this.password,
    this.passwordConfirmation,
    required this.permissions,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      password: json['password'],
      passwordConfirmation: json['password_confirmation'],
      permissions: PermissionsModel.fromJson(json['permissions'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'permissions': permissions.toJson(),
    };
  }
}
