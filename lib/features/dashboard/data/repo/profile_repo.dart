import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../constants.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../../../auth/data/models/auth_model.dart';

class ProfileRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Change Password
  Future<Either<String, SimpleModel>> changePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      var response = await dio.post(
        EndPoints.profile,
        data: {
          '_method': 'put',
          'current_password': currentPassword,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(kErrorMsg);
    }
  }

  //* Update Profile
  Future<Either<String, AuthModel>> updateProfile({
    required PickedImage? image,
    required String name,
    required String email,
  }) async {
    try {
      var data = {'_method': 'put', 'name': name, 'email': email};
      log("Data in updateProfile: $data");
      final response = await dio.multipart(
        path: EndPoints.profile,
        pickedImage: image,
        fields: data,
      );
      return Right(AuthModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateProfile: $e");
      return Left(kErrorMsg);
    }
  }

  //* Update Location
  // Future<Either<String, AuthModel>> updateLocation({
  //   required LocationDetailsModel locationDetailsModel,
  // }) async {
  //   try {
  //     var response = await dio.post(
  //       EndPoints.profile,
  //       data: {'_method': 'put', ...locationDetailsModel.toJson()},
  //     );
  //     return Right(AuthModel.fromJson(response));
  //   } on ServerException catch (e) {
  //     return Left(e.errorModel.message);
  //   } catch (e) {
  //     return Left(kErrorMsg);
  //   }
  // }
}
