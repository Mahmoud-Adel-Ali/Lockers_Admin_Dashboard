import 'locker_model.dart';
import 'user_model.dart';

class UnitModel {
  final int id;
  final int unitNumber;
  final String city;
  final String neighborhood;
  final String street;
  final String buildNumber;
  final String additionAddress;
  final double latitude;
  final double longitude;
  final int countLockers;
  final int countProgress;
  final int countAvailable;
  final int countReserved;
  final int countUnderMaintenance;
  final List<LockerModel> lockers;
  final List<UserModel> users;

  UnitModel({
    required this.id,
    required this.unitNumber,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.buildNumber,
    required this.additionAddress,
    required this.latitude,
    required this.longitude,
    required this.countLockers,
    required this.countProgress,
    required this.countAvailable,
    required this.countReserved,
    required this.countUnderMaintenance,
    required this.lockers,
    required this.users,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return UnitModel(
      id: json['id'] ?? 0,
      unitNumber: json['unitNumber'] ?? 0,
      city: json['city'] ?? '',
      neighborhood: json['neighborhood'] ?? '',
      street: json['street'] ?? '',
      buildNumber: json['buildNumber'] ?? '',
      additionAddress: json['additionAddress'] ?? '',
      latitude: double.tryParse(json['latitude']?.toString() ?? '') ?? 0.0,
      longitude: double.tryParse(json['longitude']?.toString() ?? '') ?? 0.0,
      countLockers: json['countLockers'] ?? 0,
      countProgress: json['countProgress'] ?? 0,
      countAvailable: json['countAvailable'] ?? 0,
      countReserved: json['countReserved'] ?? 0,
      countUnderMaintenance: json['countUnderMaintenance'] ?? 0,
      lockers: (json['lockers'] as List? ?? [])
          .map((e) => LockerModel.fromJson(e))
          .toList(),
      users: (json['users'] as List? ?? [])
          .map((e) => UserModel.fromJson(e ?? {}))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'unitNumber': unitNumber,
      'city': city,
      'neighborhood': neighborhood,
      'street': street,
      'buildNumber': buildNumber,
      'additionAddress': additionAddress,
      'latitude': latitude,
      'longitude': longitude,
      'countLockers': countLockers,
      'countProgress': countProgress,
      'countAvailable': countAvailable,
      'countReserved': countReserved,
      'countUnderMaintenance': countUnderMaintenance,
      'lockers': lockers.map((e) => e.toJson()).toList(),
      'users': users.map((e) => e.toJson()).toList(),
    };
  }
}
