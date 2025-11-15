import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../constants.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/services/service_locator.dart';
import '../models/all_employees_model.dart';

class EmployeesRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Get All Employees
  Future<Either<String, AllEmployeesModel>> getAllEmployees() async {
    try {
      final response = await dio.get(EndPoints.allEmployees, isFormData: false);
      return Right(AllEmployeesModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllEmployees: $e");
      return Left(kErrorMsg);
    }
  }
}
