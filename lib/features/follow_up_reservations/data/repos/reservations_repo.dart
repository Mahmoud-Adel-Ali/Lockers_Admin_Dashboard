import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../constants.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/places_model.dart';
import '../../../../core/services/service_locator.dart';
import '../../../units/data/models/all_units_response.dart';
import '../../../units/data/models/unit_orders_response_model.dart';
import '../enum/unit_customer_type.dart';

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
  Future<Either<String, UnitOrdersResponseModel>> getUnitDetails({
    required int id,
    required int page,
    required UnitCustomerType unitCustomerType,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.reservationUnitDetails}/$id?page=$page&type=${unitCustomerType.name}',
        // '${EndPoints.reservationUnitDetails}/$id?page=$page',
        isFormData: false,
      );
      return Right(UnitOrdersResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getUnitDetails [Admin]: $e");
      return Left(kErrorMsg);
    }
  }
}
