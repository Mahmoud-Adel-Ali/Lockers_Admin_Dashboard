class OrderUserModel {
  final String name;
  final String phone;
  final String image;
  final String email;

  final String city;
  final String neighborhood;
  final String street;
  final String buildNumber;

  final double latitude;
  final double longitude;

  OrderUserModel({
    required this.name,
    required this.phone,
    required this.image,
    required this.email,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.buildNumber,
    required this.latitude,
    required this.longitude,
  });

  factory OrderUserModel.fromJson(Map<String, dynamic> json) {
    return OrderUserModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      email: json['email'] ?? '',
      city: json['city'] ?? '',
      neighborhood: json['neighborhood'] ?? '',
      street: json['street'] ?? '',
      buildNumber: json['buildNumber'] ?? '',

      latitude: double.tryParse(json['latitude']?.toString() ?? '') ?? 0.0,
      longitude: double.tryParse(json['longitude']?.toString() ?? '') ?? 0.0,
    );
  }
}
