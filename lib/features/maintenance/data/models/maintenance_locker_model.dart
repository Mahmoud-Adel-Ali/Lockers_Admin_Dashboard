class MaintenanceLockerModel {
  final int id;
  final int lockerNumber;
  final int unitNumber;
  final String city;
  final String neighborhood;
  final String street;
  final String buildingNumber;
  final String additionalAddress;
  final double latitude;
  final double longitude;

  MaintenanceLockerModel({
    required this.id,
    required this.lockerNumber,
    required this.unitNumber,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.buildingNumber,
    required this.additionalAddress,
    required this.latitude,
    required this.longitude,
  });

  factory MaintenanceLockerModel.fromJson(Map<String, dynamic> json) {
    return MaintenanceLockerModel(
      id: json['id'] ?? 0,
      lockerNumber: json['lockerNumber'] ?? 0,
      unitNumber: json['unitNumber'] ?? 0,
      city: json['city'] ?? '',
      neighborhood: json['neighborhood'] ?? '',
      street: json['street'] ?? '',
      buildingNumber: json['buildingNumber'] ?? '',
      additionalAddress: json['additionalAddress'] ?? '',
      latitude: double.tryParse(json['latitude']?.toString() ?? '') ?? 0.0,
      longitude: double.tryParse(json['longitude']?.toString() ?? '') ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lockerNumber': lockerNumber,
      'unitNumber': unitNumber,
      'city': city,
      'neighborhood': neighborhood,
      'street': street,
      'buildingNumber': buildingNumber,
      'additionalAddress': additionalAddress,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
