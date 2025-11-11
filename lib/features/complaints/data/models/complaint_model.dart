import '../enums/complaints_type.dart';

class ComplaintModel {
  final int id;
  final String message;
  final String? reply;
  final String name;
  final String phone;
  final String image;
  final ComplaintsType type;

  ComplaintModel({
    required this.id,
    required this.message,
    this.reply,
    required this.name,
    required this.phone,
    required this.image,
    required this.type,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      id: json['id'] ?? 0,
      message: json['message'] ?? '',
      reply: json['reply'],
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      type: ComplaintsTypeExtension.parseFromString(json['type']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'message': message,
    'reply': reply,
    'name': name,
    'phone': phone,
    'image': image,
    'type': type.name, // "user", "company", or "employee"
  };
}
