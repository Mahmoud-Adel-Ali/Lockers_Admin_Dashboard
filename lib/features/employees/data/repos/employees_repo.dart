import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../models/all_employees_model.dart';
import '../models/employee_model.dart';

class EmployeesRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Get All Employees
  Future<Either<String, AllEmployeesModel>> getAllEmployees({
    required String search,
  }) async {
    try {
      final response = await dio.get(
        "${EndPoints.allEmployees}?search=$search",
        isFormData: false,
      );
      return Right(AllEmployeesModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllEmployees: $e");
      return Left(kErrorMsg);
    }
  }

  //* Add New Employee
  Future<Either<String, SimpleModel>> addNewEmployee({
    required XFile? image,
    required EmployeeModel employee,
  }) async {
    try {
      log('addNewEmployee [Admin]:${employee.toJson()}');
      final response = await dio.multipart(
        path: EndPoints.allEmployees,
        imageFile: image,
        fields: employee.toJson(),
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in addNewEmployee [Admin]: $e");
      return Left(kErrorMsg);
    }
  }

  //* Update Employee
  Future<Either<String, SimpleModel>> updateEmployee({
    required int id,
    required EmployeeModel employee,
  }) async {
    try {
      final response = await dio.post(
        '${EndPoints.allEmployees}/$id',
        data: {'_method': 'PUT', ...employee.toJson()},
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateEmployee [Admin]: $e");
      return Left(kErrorMsg);
    }
  }
}
