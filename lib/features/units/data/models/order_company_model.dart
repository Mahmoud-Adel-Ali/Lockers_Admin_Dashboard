class OrderCompanyModel {
  final String name;
  final String phone;
  final String email;
  final String image;
  final String city;
  final String neighborhood;
  final String street;
  final String building;
  final String additionalAddress;

  OrderCompanyModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.building,
    required this.additionalAddress,
  });

  factory OrderCompanyModel.fromJson(Map<String, dynamic> json) {
    return OrderCompanyModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      email: json['email'] ?? '',
      city: json['city'] ?? '',
      neighborhood: json['neighborhood'] ?? '',
      street: json['street'] ?? '',
      building: json['building'] ?? '',
      additionalAddress: json['additionalAddress'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'image': image,
      'email': email,
      'city': city,
      'neighborhood': neighborhood,
      'street': street,
      'building': building,
      'additionalAddress': additionalAddress,
    };
  }

  @override
  String toString() {
    return 'OrderCompanyModel(name: $name, phone: $phone, email: $email, image: $image, city: $city, neighborhood: $neighborhood, street: $street, building: $building, additionalAddress: $additionalAddress)';
  }
}
