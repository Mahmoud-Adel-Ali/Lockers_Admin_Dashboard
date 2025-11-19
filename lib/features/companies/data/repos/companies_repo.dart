import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/location_details_model.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../models/all_companies_response.dart';
import '../models/company_response.dart';

class CompaniesRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  // Get All Companies
  Future<Either<String, AllCompaniesResponse>> getAllCompanies({
    required String search,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.companies}?search=$search',
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

  // Get Company Details
  Future<Either<String, CompanyResponse>> getCompanyDetails({
    required int id,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.companies}/$id',
        isFormData: false,
      );
      return Right(CompanyResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getCompanyDetails: $e");
      return Left(e.toString());
    }
  }

  // Add New Company
  Future<Either<String, SimpleModel>> addNewCompany({
    required PickedImage image,
    required String name,
    required String adminName,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
    required LocationDetailsModel location,
  }) async {
    try {
      Map<String, dynamic> data = {
        'name': name,
        'admin_name': adminName,
        'phone': phone,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        ...location.toJson(),
      };
      final response = await dio.multipart(
        path: EndPoints.companies,
        pickedImage: image,
        fields: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in addNewCompany: $e");
      return Left(e.toString());
    }
  }

  // Update Company [status]
  Future<Either<String, SimpleModel>> updateCompanyStatus({
    required int id,
    required int status, // 0 | 1
  }) async {
    try {
      Map<String, dynamic> data = {'_method': 'PUT', 'status': status};
      log("data: $data");
      final response = await dio.post('${EndPoints.companies}/$id', data: data);
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateCompanyStatus: $e");
      return Left(e.toString());
    }
  }
}
