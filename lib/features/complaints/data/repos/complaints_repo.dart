import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../models/complaints_response_model.dart';

class ComplaintsRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Get All Complaints
  Future<Either<String, ComplaintsResponseModel>> getAllComplaints({
    required String search,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.complaints}?search=$search',
        isFormData: false,
      );
      return Right(ComplaintsResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (error) {
      log("Exception in getAllComplaints: $error");
      return Left(error.toString());
    }
  }

  //* Reply to complaint
  Future<Either<String, SimpleModel>> replyToComplaint({
    required int id,
    required String reply,
  }) async {
    try {
      final response = await dio.post(
        '${EndPoints.complaints}/$id',
        data: {'_method': 'put', 'reply': reply},
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (error) {
      log("Exception in replyToComplaint: $error");
      return Left(error.toString());
    }
  }
}
