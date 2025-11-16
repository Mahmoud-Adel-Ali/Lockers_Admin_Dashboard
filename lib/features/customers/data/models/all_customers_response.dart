import 'customers_data.dart';

class AllCustomersResponse {
  bool status;
  String message;
  CustomersData data;

  AllCustomersResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllCustomersResponse.fromJson(Map<String, dynamic> json) {
    return AllCustomersResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: CustomersData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}
