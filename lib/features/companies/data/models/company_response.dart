import 'company_model.dart';

class CompanyResponse {
  final bool status;
  final String message;
  final CompanyModel company;

  const CompanyResponse({
    required this.status,
    required this.message,
    required this.company,
  });

  factory CompanyResponse.fromJson(Map<String, dynamic> json) {
    return CompanyResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      company: CompanyModel.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': company.toJson(),
    };
  }
}
