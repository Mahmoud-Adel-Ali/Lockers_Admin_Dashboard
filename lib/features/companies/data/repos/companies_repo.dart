import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/services/service_locator.dart';
import '../models/all_companies_response.dart';

class CompaniesRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  // Get All Companies
  Future<Either<String, AllCompaniesResponse>> getAllCompanies({
    required String search,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.companies}?phone=$search',
        isFormData: false,
      );
      return Right(AllCompaniesResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllCompanies: $e");
      return Left(e.toString());
    }
  }
}
