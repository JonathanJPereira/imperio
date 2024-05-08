import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:imperio/services/sports_service.dart';
import 'package:imperio/services/championships_service.dart';
import 'package:imperio/services/tips_service.dart';
import 'package:imperio/services/bonus_service.dart';
import 'package:imperio/services/won_bets_service.dart';
import 'package:imperio/stores/sports_store.dart';
import 'package:imperio/stores/championships_store.dart';
import 'package:imperio/stores/tips_store.dart';
import 'package:imperio/stores/bonus_store.dart';
import 'package:imperio/stores/won_bets_store.dart';
import 'package:imperio/stores/navigation_store.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  // Configurações gerais
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Serviços
  getIt.registerLazySingleton<SportsService>(() => SportsService(getIt()));
  getIt.registerLazySingleton<ChampionshipsService>(
      () => ChampionshipsService(getIt()));
  getIt.registerLazySingleton<TipsService>(() => TipsService(getIt()));
  getIt.registerLazySingleton<BonusService>(() => BonusService(getIt()));
  getIt.registerLazySingleton<WonBetsService>(() => WonBetsService(getIt()));

  // Stores
  // Registra como Singleton se você deseja manter o estado em toda a aplicação
  getIt.registerSingleton<NavigationStore>(NavigationStore());
  getIt.registerSingleton<SportsStore>(SportsStore(getIt()));
  getIt.registerSingleton<ChampionshipsStore>(ChampionshipsStore(getIt()));
  getIt.registerSingleton<TipsStore>(TipsStore(getIt()));
  getIt.registerSingleton<BonusStore>(BonusStore(getIt()));
  getIt.registerSingleton<WonBetsStore>(WonBetsStore(getIt()));
}
