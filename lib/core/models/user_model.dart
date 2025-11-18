import '../enum/locker_size.dart';
import '../enum/locker_status.dart';

class UserModel {
  final String name;
  final String phone;
  final String image;
  final LockerSize size;
  final LockerStatus status;
  final int lockerNum;
  final OrderCompanyModel? company;

  UserModel({
    required this.name,
    required this.phone,
    required this.image,
    required this.size,
    required this.status,
    required this.lockerNum,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      size: parseLockerSize(json['size']),
      // TODO : tell backend about this is not found
      status: parseLockerStatus(json['status']),
      lockerNum: json['lockerNum'] ?? 0,
      company: json['company'] == null
          ? null
          : OrderCompanyModel.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'image': image,
      'size': size.name,
      'lockerNum': lockerNum,
      'company': company?.toJson(),
    };
  }
}

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
}
