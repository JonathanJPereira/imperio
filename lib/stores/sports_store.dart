import 'package:imperio/models/sport.dart';
import 'package:imperio/services/sports_service.dart';
import 'package:mobx/mobx.dart';

part 'sports_store.g.dart';

class SportsStore = _SportsStore with _$SportsStore;

abstract class _SportsStore with Store {
  final SportsService _sportsService;

  _SportsStore(this._sportsService) {
    sports.add(Sport(id: '0', name: 'Todos', image: ''));
  }

  @observable
  ObservableList<Sport> sports = ObservableList<Sport>();

  @action
  Future<void> fetchSports() async {
    final sportsList = await _sportsService.fetchSports();
    sports = ObservableList<Sport>.of(sportsList);
  }
}
