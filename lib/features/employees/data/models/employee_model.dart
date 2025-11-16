import 'permissions_model.dart';

class EmployeeModel {
  final int id;
  final String name;
  final String phone;
  final String image;
  final String email;
  final String? password;
  final String? passwordConfirmation;
  final PermissionsModel permissions;

  EmployeeModel({
    this.id = 0,
    required this.name,
    required this.phone,
    required this.image,
    required this.email,
    this.password,
    this.passwordConfirmation,
    required this.permissions,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
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
