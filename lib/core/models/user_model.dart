class UserModel {
  final String name;
  final String phone;
  final String image;
  final String size;
  final int lockerNum;
  final CompanyModel? company;

  UserModel({
    required this.name,
    required this.phone,
    required this.image,
    required this.size,
    required this.lockerNum,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      size: json['size'] ?? '',
      lockerNum: json['lockerNum'] ?? 0,
      company: CompanyModel.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'image': image,
      'size': size,
      'lockerNum': lockerNum,
      'company': company?.toJson(),
    };
  }
}

class CompanyModel {
  final String name;
  final String phone;
  final String image;
  final String city;
  final String neighborhood;
  final String street;
  final String building;
  final String additionalAddress;

  CompanyModel({
    required this.name,
    required this.phone,
    required this.image,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.building,
    required this.additionalAddress,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
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
      'city': city,
      'neighborhood': neighborhood,
      'street': street,
      'building': building,
      'additionalAddress': additionalAddress,
    };
  }
}
