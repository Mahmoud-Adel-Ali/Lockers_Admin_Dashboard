import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../errors/exception.dart';
import 'api_consumer.dart';
import 'api_interceptor.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  @override
  Future<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, String>? queryParameters,
    isFormData = true,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<T> get<T>(
    String path, {
    dynamic data,
    Map<String, String>? queryParameters,
    isFormData = true,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<T> patch<T>(
    String path, {
    dynamic data,
    Map<String, String>? queryParameters,
    isFormData = true,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, String>? queryParameters,
    isFormData = true,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, String>? queryParameters,
    isFormData = true,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  //
  @override
  Future<Map<String, dynamic>> multipart({
    required String path,
    required Map<String, String> fields,
    XFile? imageFile,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final formData = FormData.fromMap({
        ...fields,
        if (imageFile != null && File(imageFile.path).existsSync())
          'image': await MultipartFile.fromFile(
            imageFile.path,
            filename: imageFile.name,
            contentType: imageFile.path.toLowerCase().endsWith('.png')
                ? MediaType('image', 'png')
                : MediaType('image', 'jpeg'),
          ),
      });

      final response = await dio.post(
        path,
        data: formData,
        queryParameters: queryParameters,
        options: Options(contentType: 'multipart/form-data'),
      );

      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }
}
