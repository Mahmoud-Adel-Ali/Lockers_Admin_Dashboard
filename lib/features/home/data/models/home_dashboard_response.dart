class HomeDashboardResponse {
  final bool status;
  final String message;
  final HomeDashboardData data;

  HomeDashboardResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeDashboardResponse.fromJson(Map<String, dynamic> json) {
    return HomeDashboardResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: HomeDashboardData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data.toJson()};
  }
}

class HomeDashboardData {
  final int newUser;
  final int complains;
  final int employees;
  final int companies;
  final int maxVal;
  final int minVal;

  //*
  final int totalLockers;
  final int totalUnits;
  final int lockersUnderMaintenance;
  final int unitsUnderMaintenance;
  final CountModel lockers;
  final CountModel units;
  final OrdersModel orders;

  HomeDashboardData({
    required this.totalLockers,
    required this.totalUnits,
    required this.lockersUnderMaintenance,
    required this.unitsUnderMaintenance,
    required this.lockers,
    required this.units,
    required this.orders,
    required this.newUser,
    required this.complains,
    required this.employees,
    required this.companies,
    required this.maxVal,
    required this.minVal,
  });

  factory HomeDashboardData.fromJson(Map<String, dynamic> json) {
    return HomeDashboardData(
      totalLockers: json['totalLockers'] ?? 0,
      totalUnits: json['totalUnits'] ?? 0,
      lockersUnderMaintenance: json['lockersUnderMaintenance'] ?? 0,
      unitsUnderMaintenance: json['unitsUnderMaintenance'] ?? 0,
      newUser: json['newUser'] ?? 0,
      complains: json['complains'] ?? 0,
      employees: json['employees'] ?? 0,
      companies: json['companies'] ?? 0,
      maxVal: json['max'] ?? 0,
      minVal: json['min'] ?? 0,
      lockers: CountModel.fromJson(json['lockers'] ?? {}),
      units: CountModel.fromJson(json['units'] ?? {}),
      orders: OrdersModel.fromJson(json['orders'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalLockers': totalLockers,
      'totalUnits': totalUnits,
      'lockersUnderMaintenance': lockersUnderMaintenance,
      'unitsUnderMaintenance': unitsUnderMaintenance,
      'newUser': newUser,
      'complains': complains,
      'employees': employees,
      'companies': companies,
      'lockers': lockers.toJson(),
      'units': units.toJson(),
      'orders': orders.toJson(),
    };
  }
}

class CountModel {
  final int available;
  final int maintenance;

  CountModel({required this.available, required this.maintenance});

  factory CountModel.fromJson(Map<String, dynamic> json) {
    return CountModel(
      available: json['available'] ?? 0,
      maintenance: json['maintenance'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'available': available, 'maintenance': maintenance};
  }
}

class OrdersModel {
  final int year;
  final int total;
  final List<MonthlyOrders> monthly;

  OrdersModel({required this.year, required this.total, required this.monthly});

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      year: json['year'] ?? 0,
      total: json['total'] ?? 0,
      monthly: (json['monthly'] as List? ?? [])
          .map((e) => MonthlyOrders.fromJson(e ?? {}))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'total': total,
      'monthly': monthly.map((e) => e.toJson()).toList(),
    };
  }
}

class MonthlyOrders {
  final int month;
  final int orders;

  MonthlyOrders({required this.month, required this.orders});

  factory MonthlyOrders.fromJson(Map<String, dynamic> json) {
    return MonthlyOrders(
      month: json['month'] ?? 0,
      orders: json['orders'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'month': month, 'orders': orders};
  }
}
