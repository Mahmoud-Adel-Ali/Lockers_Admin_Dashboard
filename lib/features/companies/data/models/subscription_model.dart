class SubscriptionModel {
  final int id;
  final String name;
  final int duration;
  final double price;
  final int countLocker;
  final int used;
  final int remainLockers;
  final String startDate;
  final String endDate;
  final num percentage;
  final int remainDays;
  final bool isActive;

  SubscriptionModel({
    required this.id,
    required this.name,
    required this.duration,
    required this.price,
    required this.countLocker,
    required this.used,
    required this.remainLockers,
    required this.startDate,
    required this.endDate,
    required this.percentage,
    required this.remainDays,
    required this.isActive,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      duration: json['duration'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      countLocker: json['countLocker'] ?? 0,
      used: json['used'] ?? 0,
      remainLockers: json['remainLockers'] ?? 0,
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      percentage: {json['percentage'] ?? 0.0} as num,
      remainDays: json['remainDays'] ?? 0,
      isActive: json['is_active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'duration': duration,
      'price': price,
      'countLocker': countLocker,
      'used': used,
      'remainLockers': remainLockers,
      'start_date': startDate,
      'end_date': endDate,
      'percentage': percentage,
      'remainDays': remainDays,
      'is_active': isActive,
    };
  }
}
