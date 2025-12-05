class OrderUnitModel {
  final int id;
  final int unitNumber;

  final String city;
  final String neighborhood;
  final String street;
  final String buildNumber;

  final double latitude;
  final double longitude;

  OrderUnitModel({
    required this.id,
    required this.unitNumber,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.buildNumber,
    required this.latitude,
    required this.longitude,
  });

  factory OrderUnitModel.fromJson(Map<String, dynamic> json) {
    return OrderUnitModel(
      id: json['id'] ?? 0,
      unitNumber: json['unitNumber'] ?? 0,

      city: json['city'] ?? '',
      neighborhood: json['neighborhood'] ?? '',
      street: json['street'] ?? '',
      buildNumber: json['buildNumber'] ?? '',

      latitude: double.tryParse(json['latitude']?.toString() ?? '') ?? 0.0,
      longitude: double.tryParse(json['longitude']?.toString() ?? '') ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'OrderUnitModel(id: $id, unitNumber: $unitNumber, city: $city, neighborhood: $neighborhood, street: $street, buildNumber: $buildNumber, latitude: $latitude, longitude: $longitude)';
  }
}
