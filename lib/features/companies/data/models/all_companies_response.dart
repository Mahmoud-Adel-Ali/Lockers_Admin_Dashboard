import 'company_model.dart';

class AllCompaniesResponse {
  final bool status;
  final String message;
  final List<CompanyModel> companies;

  const AllCompaniesResponse({
    required this.status,
    required this.message,
    this.companies = const [],
  });

  factory AllCompaniesResponse.fromJson(Map<String, dynamic> json) {
    return AllCompaniesResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      companies:
          (json['data'] as List?)
              ?.map((e) => CompanyModel.fromJson(e))
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': companies.map((e) => e.toJson()).toList(),
    };
  }
}
