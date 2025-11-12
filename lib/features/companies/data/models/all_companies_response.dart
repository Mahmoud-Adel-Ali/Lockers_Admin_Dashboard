import 'company_model.dart';

class AllCompaniesResponse {
  final bool status;
  final String message;
  final List<CompanyModel> data;

  const AllCompaniesResponse({
    required this.status,
    required this.message,
    this.data = const [],
  });

  factory AllCompaniesResponse.fromJson(Map<String, dynamic> json) {
    return AllCompaniesResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List?)
              ?.map((e) => CompanyModel.fromJson(e))
              .toList() ??
          const [],
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
