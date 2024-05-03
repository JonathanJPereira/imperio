import 'package:imperio/models/championship.dart';
import 'package:imperio/services/championships_service.dart';
import 'package:mobx/mobx.dart';

part 'championships_store.g.dart';

class ChampionshipsStore = _ChampionshipsStore with _$ChampionshipsStore;

abstract class _ChampionshipsStore with Store {
  final ChampionshipsService _championshipsService;

  _ChampionshipsStore(this._championshipsService);

  @observable
  ObservableList<Championship> championships = ObservableList<Championship>();

  @action
  Future<void> fetchChampionships() async {
    final championshipsList = await _championshipsService.fetchChampionships();
    championships = ObservableList<Championship>.of(championshipsList);
  }
}
