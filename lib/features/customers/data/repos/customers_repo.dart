import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
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
    } catch (e) {
      return Left(e.toString());
    }
  }
}
