class SimpleModel {
  final bool status;
  final String message;

  SimpleModel({required this.status, required this.message});

  factory SimpleModel.fromJson(Map<String, dynamic> json) {
    return SimpleModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
