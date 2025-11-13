import '../enum/locker_size.dart';
import '../enum/locker_status.dart';

class LockerModel {
  final int id;
  final int lockerNumber;
  final LockerStatus type;
  final LockerSize size;
  final bool underMaintenance;

  LockerModel({
    required this.id,
    required this.lockerNumber,
    required this.type,
    required this.size,
    required this.underMaintenance,
  });

  factory LockerModel.fromJson(Map<String, dynamic> json) {
    return LockerModel(
      id: json['id'] ?? 0,
      lockerNumber: json['lockerNumber'] ?? 0,
      type: parseLockerStatus(json['type']),
      size: parseLockerSize(json['size']),
      underMaintenance:
          json['underMaintenance'] == 1 || json['underMaintenance'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lockerNumber': lockerNumber,
      'type': type.name,
      'size': size.name,
      'underMaintenance': underMaintenance ? 1 : 0,
    };
  }
}
