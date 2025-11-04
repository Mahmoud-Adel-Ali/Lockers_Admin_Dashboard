class LocationDetailsModel {
  final double latitude;
  final double longitude;
  final String? country;
  final String? city;
  final String? neighborhood;
  final String? street;
  final String? postalCode;
  final String? buildingNum;
  final String? administrativeArea;

  LocationDetailsModel({
    required this.latitude,
    required this.longitude,
    this.country,
    this.city,
    this.neighborhood,
    this.street,
    this.buildingNum,
    this.postalCode,
    this.administrativeArea,
  });

  factory LocationDetailsModel.fromJson(Map<String, dynamic> json) {
    return LocationDetailsModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      country: json['country'],
      city: json['city'],
      neighborhood: json['neighborhood'],
      street: json['street'],
      buildingNum: json['buildingNum'] ?? '',
      postalCode: json['postalCode'],
      administrativeArea: json['administrativeArea'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
      'neighborhood': neighborhood,
      'street': street,
      'buildNumber': buildingNum,
      'additionAddress': administrativeArea,
    };
  }

  @override
  String toString() {
    return 'LocationDetailsModel('
        'latitude: $latitude, '
        'longitude: $longitude, '
        'country: $country, '
        'city: $city, '
        'neighborhood: $neighborhood, '
        'street: $street, '
        'postalCode: $postalCode, '
        'administrativeArea: $administrativeArea'
        ')';
  }
}
