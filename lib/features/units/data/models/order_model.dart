import '../../../../core/enum/locker_size.dart';
import '../enum/order_status.dart';
import 'order_company_model.dart';
import 'order_employee_model.dart';
import 'order_unit_model.dart';
import 'order_user_model.dart';

class OrderModel {
  final int id;
  final String placeAtDate;
  final String placeAtDateHour;
  final String placeUpDate;
  final String placeUpDateHour;
  final LockerSize size;
  final OrderStatus status;
  final int lockerNumber;

  final OrderUserModel user;
  final OrderEmployeeModel? employee;
  final OrderUnitModel unit;
  final OrderCompanyModel? company;

  OrderModel({
    required this.id,
    required this.placeAtDate,
    required this.placeAtDateHour,
    required this.placeUpDate,
    required this.placeUpDateHour,
    required this.size,
    required this.status,
    required this.lockerNumber,
    required this.user,
    this.employee,
    required this.unit,
    this.company,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? 0,
      placeAtDate: json['placeAtDate'] ?? '',
      placeAtDateHour: json['placeAtDateHour'] ?? '',
      placeUpDate: json['placeUpDate'] ?? '',
      placeUpDateHour: json['placeUpDateHour'] ?? '',
      size: parseLockerSize(json['size']),
      status: OrderStatusExtension.fromApi(json['status']),
      lockerNumber: json['lockerNumber'] ?? 0,

      user: OrderUserModel.fromJson(json['user'] ?? {}),
      employee: json['employee'] == null
          ? null
          : OrderEmployeeModel.fromJson(json['employee'] ?? {}),
      unit: OrderUnitModel.fromJson(json['unit'] ?? {}),
      company: json['company'] == null
          ? null
          : OrderCompanyModel.fromJson(json['company'] ?? {}),
    );
  }
}
