import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:imperio/services/login_service.dart';
import 'package:imperio/services/matches_service.dart';
import 'package:imperio/services/sports_service.dart';
import 'package:imperio/services/championships_service.dart';
import 'package:imperio/services/tips_service.dart';
import 'package:imperio/services/bonus_service.dart';
import 'package:imperio/services/won_bets_service.dart';
import 'package:imperio/stores/login_store.dart';
import 'package:imperio/stores/matches_store.dart';
import 'package:imperio/stores/sports_store.dart';
import 'package:imperio/stores/championships_store.dart';
import 'package:imperio/stores/tab_selector_store.dart';
import 'package:imperio/stores/tips_store.dart';
import 'package:imperio/stores/bonus_store.dart';
import 'package:imperio/stores/won_bets_store.dart';
import 'package:imperio/stores/navigation_store.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  // Dio é configurado como LazySingleton para garantir que apenas uma instância seja criada quando necessário.
  // Isso é útil para compartilhar uma única instância de configuração HTTP por todo o app.
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Serviços são registrados como LazySingletons para garantir que sejam criados apenas quando acessados pela primeira vez,
  // melhorando a eficiência da inicialização e reduzindo o consumo de recursos no startup.
  getIt.registerLazySingleton<SportsService>(() => SportsService(getIt()));
  getIt.registerLazySingleton<ChampionshipsService>(
      () => ChampionshipsService(getIt()));
  getIt.registerLazySingleton<TipsService>(() => TipsService(getIt()));
  getIt.registerLazySingleton<BonusService>(() => BonusService(getIt()));
  getIt.registerLazySingleton<WonBetsService>(() => WonBetsService(getIt()));
  getIt.registerLazySingleton<MatchesService>(() => MatchesService(getIt()));
  getIt.registerLazySingleton<LoginService>(() => LoginService(getIt()));

  // Stores são registradas como LazySingletons para garantir que sejam criadas apenas quando acessadas pela primeira vez,
  // melhorando a eficiência da inicialização e reduzindo o consumo de recursos no startup.
  getIt.registerLazySingleton<SportsStore>(() => SportsStore(getIt()));
  getIt.registerLazySingleton<ChampionshipsStore>(
      () => ChampionshipsStore(getIt()));
  getIt.registerLazySingleton<TipsStore>(() => TipsStore(getIt()));
  getIt.registerLazySingleton<BonusStore>(() => BonusStore(getIt()));
  getIt.registerLazySingleton<WonBetsStore>(() => WonBetsStore(getIt()));
  getIt.registerLazySingleton<MatchesStore>(() => MatchesStore(getIt()));
  getIt.registerLazySingleton<LoginStore>(() => LoginStore(getIt()));

  // NavigationStore é registrado como Singleton para manter o estado de navegação compartilhado globalmente por toda a aplicação.
  // Isso permite que o estado de navegação seja acessado de forma consistente em diferentes partes do app.
  getIt.registerSingleton<NavigationStore>(NavigationStore());

  // TabSelectorStore é registrado como Factory para fornecer uma nova instância cada vez que for solicitado.
  // Isso é ideal para componentes que necessitam de um estado independente, evitando interferências entre diferentes usos.
  getIt.registerFactory<TabSelectorStore>(() => TabSelectorStore());
}
