import 'company_employee_model.dart';
import 'subscription_model.dart';

class CompanyModel {
  final int id;
  final String name;
  final String adminName;
  final String phone;
  final String email;
  final String image;
  final String city;
  final String neighborhood;
  final String street;
  final String buildNumber;
  final String additionAddress;
  final double latitude;
  final double longitude;
  final SubscriptionModel? subscription;
  final List<CompanyEmployeeModel> employees;

  const CompanyModel({
    this.id = 0,
    required this.name,
    required this.adminName,
    required this.phone,
    this.email = '',
    required this.image,
    this.city = '',
    this.neighborhood = '',
    this.street = '',
    this.buildNumber = '',
    this.additionAddress = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.subscription,
    this.employees = const [],
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      adminName: json['admin_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
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
      subscription: json['subscription'] != null
          ? SubscriptionModel.fromJson(json['subscription'])
          : null,
      employees:
          (json['employees'] as List?)
              ?.map((e) => CompanyEmployeeModel.fromJson(e))
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'admin_name': adminName,
      'phone': phone,
      'email': email,
      'image': image,
      'city': city,
      'neighborhood': neighborhood,
      'street': street,
      'buildNumber': buildNumber,
      'additionAddress': additionAddress,
      'latitude': latitude,
      'longitude': longitude,
      'subscription': subscription?.toJson(),
      'employees': employees.map((e) => e.toJson()).toList(),
    };
  }
}
