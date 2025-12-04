import 'order_pagination_data.dart';

class UnitOrdersResponseModel {
  final bool status;
  final String message;
  final OrderPaginationData data;

  UnitOrdersResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UnitOrdersResponseModel.fromJson(Map<String, dynamic> json) {
    return UnitOrdersResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: OrderPaginationData.fromJson(json['data'] ?? {}),
    );
  }
}
