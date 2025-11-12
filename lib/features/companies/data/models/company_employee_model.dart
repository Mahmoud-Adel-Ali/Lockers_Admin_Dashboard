class CompanyEmployeeModel {
  final String name;
  final String phone;
  final String image;
  final String city;
  final String neighborhood;
  final String street;
  final String buildNumber;
  final String additionAddress;
  final double latitude;
  final double longitude;

  CompanyEmployeeModel({
    required this.name,
    required this.phone,
    required this.image,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.buildNumber,
    required this.additionAddress,
    required this.latitude,
    required this.longitude,
  });

  factory CompanyEmployeeModel.fromJson(Map<String, dynamic> json) {
    return CompanyEmployeeModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      city: json['city'] ?? '',
      neighborhood: json['neighborhood'] ?? '',
      street: json['street'] ?? '',
      buildNumber: json['buildNumber'] ?? '',
      additionAddress: json['additionAddress'] ?? '',
      latitude: (json['latitude'] != null)
          ? double.tryParse(json['latitude'].toString()) ?? 0.0
          : 0.0,
      longitude: (json['longitude'] != null)
          ? double.tryParse(json['longitude'].toString()) ?? 0.0
          : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'image': image,
      'city': city,
      'neighborhood': neighborhood,
      'street': street,
      'buildNumber': buildNumber,
      'additionAddress': additionAddress,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
