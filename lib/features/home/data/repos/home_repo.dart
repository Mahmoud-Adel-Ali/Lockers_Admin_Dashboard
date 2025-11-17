import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../constants.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/services/service_locator.dart';
import '../models/home_dashboard_response.dart';

class HomeRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Get Home Dashboard Data
  Future<Either<String, HomeDashboardResponse>> getHomeDashboardData() async {
    try {
      final response = await dio.get(
        EndPoints.homeDashboard,
        isFormData: false,
      );
      return Right(HomeDashboardResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getHomeDashboardData: $e");
      return Left(kErrorMsg);
    }
  }
}
