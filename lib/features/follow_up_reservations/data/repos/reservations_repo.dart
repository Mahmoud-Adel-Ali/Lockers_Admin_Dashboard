import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../constants.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/places_model.dart';
import '../../../../core/services/service_locator.dart';
import '../../../units/data/models/all_units_response.dart';
import '../../../units/data/models/unit_details_response.dart';

class ReservationsRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Get All Regions
  Future<Either<String, PlacesModel>> getAllRegions() async {
    try {
      final response = await dio.get(
        EndPoints.ordersRegions,
        isFormData: false,
      );
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
      final response = await dio.get(
        EndPoints.allReservationUnits,
        isFormData: false,
      );
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
        '${EndPoints.reservationUnitDetails}/$id',
        isFormData: false,
      );
      return Right(UnitDetailsResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
    // catch (e) {
    //   log("Exception in getUnitDetails [Admin]: $e");
    //   return Left(kErrorMsg);
    // }
  }
}
