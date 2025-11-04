import 'admin_data.dart';

class AuthModel {
  final bool status;
  final String message;
  final AdminData? data;

  AuthModel({required this.status, required this.message, this.data});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? AdminData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data?.toJson()};
  }
}
