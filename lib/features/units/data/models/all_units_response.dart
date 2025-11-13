import '../../../../core/models/unit_model.dart';

class AllUnitsResponse {
  final bool status;
  final String message;
  final List<UnitModel> data;

  AllUnitsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllUnitsResponse.fromJson(Map<String, dynamic> json) {
    return AllUnitsResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List?)
              ?.map((e) => UnitModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
