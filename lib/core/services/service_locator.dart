import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../api/dio_consumer.dart';

// import '../api/dio_consumer.dart';

final getit = GetIt.instance;
void setupServicesLocator() {
  getit.registerSingleton<Dio>(Dio());
  getit.registerSingleton<DioConsumer>(DioConsumer(dio: getit.get<Dio>()));
}
