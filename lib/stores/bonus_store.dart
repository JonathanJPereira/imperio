import 'package:imperio/models/bonus.dart';
import 'package:imperio/services/bonus_service.dart';
import 'package:mobx/mobx.dart';

part 'bonus_store.g.dart';

class BonusStore = _BonusStore with _$BonusStore;

abstract class _BonusStore with Store {
  final BonusService _bonusService;

  _BonusStore(this._bonusService);

  @observable
  ObservableList<Bonus> bonuses = ObservableList<Bonus>();

  @action
  Future<void> fetchBonuses() async {
    try {
      final bonusList = await _bonusService.fetchBonuses();
      bonuses = ObservableList<Bonus>.of(bonusList);
    } catch (e) {
      print('Failed to load bonuses: ${e.toString()}');
    }
  }
}
