import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:imperio/services/sports_service.dart';
import 'package:imperio/stores/sports_store.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<SportsService>(() => SportsService(getIt()));
  getIt.registerFactory<SportsStore>(() => SportsStore(getIt()));
}
