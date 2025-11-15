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

class MaintenanceRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Get Regions Of Maintaince Units
  Future<Either<String, PlacesModel>> getRegionsOfMaintainceUnits() async {
    try {
      final response = await dio.get(
        EndPoints.regionsOfMaintainceUnits,
        isFormData: false,
      );
      return Right(PlacesModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getRegionsOfMaintainceUnits: $e");
      return Left(kErrorMsg);
    }
  }

  //* Get Regions Of Maintaince Lockers
  Future<Either<String, PlacesModel>> getRegionsOfMaintainceLockers() async {
    try {
      final response = await dio.get(
        EndPoints.regionsOfMaintainceLockers,
        isFormData: false,
      );
      return Right(PlacesModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getRegionsOfMaintainceLockers: $e");
      return Left(kErrorMsg);
    }
  }

  //* Get Maintaince Units
  Future<Either<String, AllUnitsResponse>> getMaintainceUnits() async {
    try {
      final response = await dio.get(
        EndPoints.maintenanceUnits,
        isFormData: false,
      );
      return Right(AllUnitsResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getMaintainceUnits: $e");
      return Left(kErrorMsg);
    }
  }

  //* Get Maintaince Lockers
  Future<Either<String, AllUnitsResponse>> getMaintainceLockers() async {
    try {
      final response = await dio.get(
        EndPoints.maintenanceLockers,
        isFormData: false,
      );
      // TODO : Change AllUnitsResponse to AllLockersResponse
      return Right(AllUnitsResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getMaintainceLockers: $e");
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
        '${EndPoints.maintenanceUnits}/$id',
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
        '${EndPoints.maintenanceLockers}/$id',
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
