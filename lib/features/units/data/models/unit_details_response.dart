import '../../../../core/models/unit_model.dart';

class UnitDetailsResponse {
  final bool status;
  final String message;
  final UnitModel? data;

  UnitDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UnitDetailsResponse.fromJson(Map<String, dynamic> json) {
    return UnitDetailsResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? UnitModel.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data?.toJson()};
  }
}
