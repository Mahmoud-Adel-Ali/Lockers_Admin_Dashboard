import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../constants.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../models/auth_model.dart';

class AuthRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  Future<Either<String, AuthModel>> signin({
    required String phone,
    required String password,
  }) async {
    Map<String, dynamic> data = {'phone': phone, 'password': password};
    try {
      final response = await dio.post(EndPoints.signin, data: data);
      return Right(AuthModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in signin: $e");
      return Left(kErrorMsg);
    }
  }

  // Forget password

  Future<Either<String, SimpleModel>> forgetPassword({
    required String phone,
  }) async {
    Map<String, dynamic> data = {'phone': phone};
    try {
      final response = await dio.post(EndPoints.forgetPassword, data: data);
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in forgetPassword: $e");
      return Left(kErrorMsg);
    }
  }

  // Verify OTP
  Future<Either<String, SimpleModel>> verifyOTP({
    required String phone,
    required String otp,
  }) async {
    Map<String, dynamic> data = {'phone': phone, 'otp': otp};
    try {
      final response = await dio.post(EndPoints.verifyOTP, data: data);
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in verifyOTP: $e");
      return Left(kErrorMsg);
    }
  }

  // Reset Password
  Future<Either<String, SimpleModel>> resetPassword({
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    Map<String, dynamic> data = {
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    try {
      final response = await dio.post(EndPoints.resetPassword, data: data);
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in resetPassword: $e");
      return Left(kErrorMsg);
    }
  }
}
