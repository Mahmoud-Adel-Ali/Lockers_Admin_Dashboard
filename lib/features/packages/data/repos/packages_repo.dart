import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../models/package_model.dart';
import '../models/packages_response_model.dart';

class PackagesRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Get All Packages
  Future<Either<String, PackagesResponseModel>> getPackages() async {
    try {
      final response = await dio.get(EndPoints.packages, isFormData: false);
      return Right(PackagesResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getPackages: $e");
      return Left(e.toString());
    }
  }

  //* Update Package
  Future<Either<String, SimpleModel>> updatePackage({
    required PackageModel package,
  }) async {
    try {
      final response = await dio.post(
        "${EndPoints.packages}/${package.id}",
        data: {"_method": "put", ...package.toJson()},
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updatePackage: $e");
      return Left(e.toString());
    }
  }
}
