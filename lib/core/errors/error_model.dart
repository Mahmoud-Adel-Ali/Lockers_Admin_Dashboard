class ErrorModel {
  final dynamic status;
  final String message;

  ErrorModel({required this.status, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    status: json['status'] as dynamic,
    message: json['message'] as String,
  );

  // to string
  @override
  String toString() => 'ErrorModel(status: $status, message: $message)';
}
