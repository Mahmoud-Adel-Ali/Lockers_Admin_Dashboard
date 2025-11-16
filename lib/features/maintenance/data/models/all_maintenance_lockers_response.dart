import 'maintenance_locker_model.dart';

class AllMaintenanceLockerResponse {
  final bool status;
  final String message;
  final List<MaintenanceLockerModel> lockers;

  AllMaintenanceLockerResponse({
    required this.status,
    required this.message,
    required this.lockers,
  });

  factory AllMaintenanceLockerResponse.fromJson(Map<String, dynamic> json) {
    return AllMaintenanceLockerResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      lockers:
          (json['data'] as List?)
              ?.map((e) => MaintenanceLockerModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': lockers.map((e) => e.toJson()).toList(),
    };
  }
}
