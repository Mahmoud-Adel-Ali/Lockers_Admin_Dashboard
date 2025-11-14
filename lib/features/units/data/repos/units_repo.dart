import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../constants.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/enum/locker_size.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/places_model.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../models/all_units_response.dart';
import '../models/unit_details_response.dart';

class UnitsRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Get All Regions
  Future<Either<String, PlacesModel>> getAllRegions() async {
    try {
      final response = await dio.get(EndPoints.adminRegions, isFormData: false);
      return Right(PlacesModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllRegions [Admin]: $e");
      return Left(kErrorMsg);
    }
  }

  //* Get All Units
  Future<Either<String, AllUnitsResponse>> getAllUnits() async {
    try {
      final response = await dio.get(EndPoints.adminUnits, isFormData: false);
      return Right(AllUnitsResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllUnits [Admin]: $e");
      return Left(kErrorMsg);
    }
  }

  //* Get Unit Details
  Future<Either<String, UnitDetailsResponse>> getUnitDetails({
    required int id,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.adminUnits}/$id',
        isFormData: false,
      );
      return Right(UnitDetailsResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getUnitDetails [Admin]: $e");
      return Left(kErrorMsg);
    }
  }

  //* Send Unit to mantenance
  Future<Either<String, SimpleModel>> sendUnitToMaintenance({
    required int id,
  }) async {
    try {
      Map<String, dynamic> data = {'_method': 'PUT', 'under_maintenance': 1};
      final response = await dio.post(
        '${EndPoints.maintenanceUnits}/$id',
        data: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in sendUnitToMaintenance [Admin]: $e");
      return Left(kErrorMsg);
    }
  }

  //* Sent Locker to maintenance
  Future<Either<String, SimpleModel>> sendLockerToMaintenance({
    required int id,
  }) async {
    try {
      Map<String, dynamic> data = {'_method': 'PUT', 'under_maintenance': 1};
      final response = await dio.post(
        '${EndPoints.maintenanceLockers}/$id',
        data: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in sendLockerToMaintenance [Admin]: $e");
      return Left(kErrorMsg);
    }
  }

  //* Add Locker to Unit
  Future<Either<String, SimpleModel>> addLockerToUnit({
    required int unitId,
    required LockerSize size,
  }) async {
    try {
      Map<String, dynamic> data = {'unit_id': unitId, 'size': size.name};
      final response = await dio.post(EndPoints.adminLockers, data: data);
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in addLockerToUnit [Admin]: $e");
      return Left(kErrorMsg);
    }
  }

  //* Update Locker in Unit
  Future<Either<String, SimpleModel>> updateLockerInUnit({
    required int unitId,
    required int lockerId,
    required LockerSize size,
  }) async {
    try {
      Map<String, dynamic> data = {
        '_method': 'PUT',
        'unit_id': unitId,
        'size': size.name,
      };
      final response = await dio.post(
        '${EndPoints.adminLockers}/$lockerId',
        data: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateLockerInUnit [Admin]: $e");
      return Left(kErrorMsg);
    }
  }
}
