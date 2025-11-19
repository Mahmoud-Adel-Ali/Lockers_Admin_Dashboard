import '../models/picked_image_model.dart';

abstract class ApiConsumer {
  Future<T> get<T>(
    String path, {
    Object? data,
    Map<String, String>? queryParameters,
    bool isFormData = false,
  });

  Future<T> delete<T>(
    String path, {
    Object? data,
    Map<String, String>? queryParameters,
    bool isFormData = false,
  });

  Future<T> post<T>(
    String path, {
    Object? data,
    Map<String, String>? queryParameters,
    bool isFormData = false,
  });

  Future<T> patch<T>(
    String path, {
    Object? data,
    Map<String, String>? queryParameters,
    bool isFormData = false,
  });

  Future<T> put<T>(
    String path, {
    Object? data,
    Map<String, String>? queryParameters,
    bool isFormData = false,
  });

  Future<Map<String, dynamic>> multipart({
    required String path,
    required Map<String, dynamic> fields,
    PickedImage? pickedImage,
    Map<String, String>? queryParameters,
  });
}
