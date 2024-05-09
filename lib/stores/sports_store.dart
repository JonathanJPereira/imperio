import 'package:imperio/models/sport.dart';
import 'package:imperio/services/sports_service.dart';
import 'package:mobx/mobx.dart';

part 'sports_store.g.dart';

class SportsStore = _SportsStore with _$SportsStore;

abstract class _SportsStore with Store {
  final SportsService _sportsService;

  _SportsStore(this._sportsService) {
    fetchSports();
  }

  @observable
  ObservableList<Sport> sports = ObservableList<Sport>();

  @observable
  String filter = '';

  @computed
  List<Sport> get filteredSports {
    if (filter.isEmpty) {
      return sports;
    } else {
      return sports
          .where((sport) =>
              sport.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @action
  Future<void> fetchSports() async {
    final sportsList = await _sportsService.fetchSports();
    sports = ObservableList<Sport>.of(sportsList);
  }

  @action
  void setFilter(String value) {
    filter = value;
  }
}
