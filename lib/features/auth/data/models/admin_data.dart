import 'permission_model.dart';

class AdminData {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String image;
  final bool active;
  final String role;
  final PermissionModel permissions;
  final String token;

  AdminData({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.active,
    required this.role,
    required this.permissions,
    required this.token,
  });

  factory AdminData.fromJson(Map<String, dynamic> json) {
    return AdminData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      active: json['active'] ?? false,
      role: json['role'] ?? '',
      permissions: PermissionModel.fromJson(json['permissions'] ?? {}),
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'image': image,
      'active': active,
      'role': role,
      'permissions': permissions.toJson(),
      'token': token,
    };
  }
}
