import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../enums/customer_type.dart';
import '../models/all_customers_response.dart';

class CustomersRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Get All Customers
  Future<Either<String, AllCustomersResponse>> getAllCustomers({
    String search = '',
    int page = 1,
    CustomerType status = CustomerType.all,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.customers}?search=$search&page=$page&status=${customerTypeToString(status)}',
        isFormData: false,
      );
      return Right(AllCustomersResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log('Exception in getAllCustomers :- $e');
      return Left(e.toString());
    }
  }

  //* Update Status
  Future<Either<String, SimpleModel>> updateCustomerStatus({
    required int id,
    required CustomerType status,
  }) async {
    try {
      Map<String, dynamic> data = {
        '_method': 'PUT',
        'status': customerTypeToString(status),
      };
      log("Update Status Data: $data");
      final response = await dio.post('${EndPoints.customers}/$id', data: data);
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log('Exception in updateCustomerStatus :- $e');
      return Left(e.toString());
    }
  }
}
