import 'customer_model.dart';

class CustomersData {
  final int currentPage;
  final List<CustomerModel> data;
  final int from;
  final int lastPage;
  final int perPage;
  final int to;
  final int total;

  CustomersData({
    this.currentPage = 0,
    this.data = const [],
    this.from = 0,
    this.lastPage = 0,
    this.perPage = 0,
    this.to = 0,
    this.total = 0,
  });

  factory CustomersData.fromJson(Map<String, dynamic> json) => CustomersData(
    currentPage: json['current_page'] ?? 0,
    data: json['data'] != null
        ? List<CustomerModel>.from(
            json['data'].map((x) => CustomerModel.fromJson(x)),
          )
        : const [],
    from: json['from'] ?? 0,
    lastPage: json['last_page'] ?? 0,
    perPage: json['per_page'] ?? 0,
    to: json['to'] ?? 0,
    total: json['total'] ?? 0,
  );

  // to json
  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'data': data.map((x) => x.toJson()).toList(),
    'from': from,
    'last_page': lastPage,
    'per_page': perPage,
    'to': to,
    'total': total,
  };
}
