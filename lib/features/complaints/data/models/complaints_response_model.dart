import 'complaint_model.dart';

class ComplaintsResponseModel {
  final bool status;
  final String message;
  final List<ComplaintModel> data;

  ComplaintsResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ComplaintsResponseModel.fromJson(Map<String, dynamic> json) {
    return ComplaintsResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => ComplaintModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.map((e) => e.toJson()).toList(),
  };
}
