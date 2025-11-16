import '../enums/customer_type.dart';

class CustomerModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final CustomerType status;
  final String city;
  final String neighborhood;
  final String street;
  final String buildNumber;
  final String additionalAddress;
  final double latitude;
  final double longitude;
  final String image;
  final String face;
  final String back;
  final String video;

  CustomerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.buildNumber,
    required this.additionalAddress,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.face,
    required this.back,
    required this.video,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    double parseDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      return double.tryParse(value.toString()) ?? 0.0;
    }

    return CustomerModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      status: customerTypeFromString(json['status']?.toString() ?? ''),
      city: json['city'] ?? '',
      neighborhood: json['neighborhood'] ?? '',
      street: json['street'] ?? '',
      buildNumber: json['buildNumber'] ?? '',
      additionalAddress: json['additionAddress'] ?? '',
      latitude: parseDouble(json['latitude']),
      longitude: parseDouble(json['longitude']),
      image: json['image'] ?? '',
      face: json['cardFace'] ?? '',
      back: json['cardBack'] ?? '',
      video: json['video'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'status': status.name,
      'city': city,
      'neighborhood': neighborhood,
      'street': street,
      'buildNumber': buildNumber,
      'additionAddress': additionalAddress,
      'latitude': latitude,
      'longitude': longitude,
      'image': image,
      'cardFace': face,
      'cardBack': back,
      'video': video,
    };
  }
}
