import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:imperio/services/sports_service.dart';
import 'package:imperio/services/championships_service.dart';
import 'package:imperio/services/tips_service.dart';
import 'package:imperio/stores/sports_store.dart';
import 'package:imperio/stores/championships_store.dart';
import 'package:imperio/stores/tips_store.dart'; 

GetIt getIt = GetIt.instance;

void setupLocator() {
  // Configurações gerais
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Serviços e stores para esportes
  getIt.registerLazySingleton<SportsService>(() => SportsService(getIt()));
  getIt.registerFactory<SportsStore>(() => SportsStore(getIt()));

  // Serviços e stores para campeonatos
  getIt.registerLazySingleton<ChampionshipsService>(() => ChampionshipsService(getIt()));
  getIt.registerFactory<ChampionshipsStore>(() => ChampionshipsStore(getIt()));

  // Serviços e stores para dicas
  getIt.registerLazySingleton<TipsService>(() => TipsService(getIt()));
  getIt.registerFactory<TipsStore>(() => TipsStore(getIt()));
}
