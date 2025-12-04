import 'order_model.dart';

class OrderPaginationData {
  final int currentPage;
  final List<OrderModel> orders;
  final int total;
  final int perPage;
  final int lastPage;

  OrderPaginationData({
    required this.currentPage,
    required this.orders,
    required this.total,
    required this.perPage,
    required this.lastPage,
  });

  factory OrderPaginationData.fromJson(Map<String, dynamic> json) {
    return OrderPaginationData(
      currentPage: json['current_page'] ?? 0,
      orders: (json['data'] as List<dynamic>? ?? [])
          .map((e) => OrderModel.fromJson(e))
          .toList(),
      total: json['total'] ?? 0,
      perPage: json['per_page'] ?? 0,
      lastPage: json['last_page'] ?? 0,
    );
  }
}
