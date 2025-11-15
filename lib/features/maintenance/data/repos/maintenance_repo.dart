import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../constants.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/places_model.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../../../units/data/models/all_units_response.dart';
import '../models/all_maintenance_lockers_response.dart';

class MaintenanceRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Get Regions Of Maintenance Units
  Future<Either<String, PlacesModel>> getRegionsOfMaintenanceUnits() async {
    try {
      final response = await dio.get(
        EndPoints.regionsOfMaintenanceUnits,
        isFormData: false,
      );
      return Right(PlacesModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getRegionsOfMaintenanceUnits: $e");
      return Left(kErrorMsg);
    }
  }

  //* Get Regions Of Maintenance Lockers
  Future<Either<String, PlacesModel>> getRegionsOfMaintenanceLockers() async {
    try {
      final response = await dio.get(
        EndPoints.regionsOfMaintenanceLockers,
        isFormData: false,
      );
      return Right(PlacesModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getRegionsOfMaintenanceLockers: $e");
      return Left(kErrorMsg);
    }
  }

  //* Get Maintenance Units
  Future<Either<String, AllUnitsResponse>> getMaintenanceUnits() async {
    try {
      final response = await dio.get(
        EndPoints.maintenanceUnits,
        isFormData: false,
      );
      return Right(AllUnitsResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getMaintenanceUnits: $e");
      return Left(kErrorMsg);
    }
  }

  //* Get Maintenance Lockers
  Future<Either<String, AllMaintenanceLockerResponse>>
  getMaintenanceLockers() async {
    try {
      final response = await dio.get(
        EndPoints.maintenanceLockers,
        isFormData: false,
      );
      return Right(AllMaintenanceLockerResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getMaintenanceLockers: $e");
      return Left(kErrorMsg);
    }
  }

  //* delete Unit from mantenance
  Future<Either<String, SimpleModel>> deleteUnitFromMaintenance({
    required int id,
  }) async {
    try {
      Map<String, dynamic> data = {'_method': 'PUT', 'under_maintenance': 0};
      final response = await dio.post(
        '${EndPoints.updateMaintenanceUnits}/$id',
        data: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in deleteUnitFromMaintenance [Admin]: $e");
      return Left(kErrorMsg);
    }
  }

  //* Delete Locker from maintenance
  Future<Either<String, SimpleModel>> deleteLockerFromMaintenance({
    required int id,
  }) async {
    try {
      Map<String, dynamic> data = {'_method': 'PUT', 'under_maintenance': 0};
      final response = await dio.post(
        '${EndPoints.updateMaintenanceLockers}/$id',
        data: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in deleteLockerFromMaintenance [Admin]: $e");
      return Left(kErrorMsg);
    }
  }
}
