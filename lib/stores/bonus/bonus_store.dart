import 'package:imperio/models/bonus.dart';
import 'package:imperio/services/bonus_service.dart';
import 'package:mobx/mobx.dart';

part 'bonus_store.g.dart';

class BonusStore = _BonusStore with _$BonusStore;

abstract class _BonusStore with Store {
  final BonusService _bonusService;

  _BonusStore(this._bonusService) {
    fetchBonuses();
  }

  @observable
  ObservableList<Bonus> bonuses = ObservableList<Bonus>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchBonuses() async {
    isLoading = true;
    errorMessage = null;
    try {
      final bonusList = await _bonusService.fetchBonuses();
      bonuses = ObservableList<Bonus>.of(bonusList);
    } catch (e) {
      errorMessage = 'Failed to load bonuses: ${e.toString()}';
    } finally {
      isLoading = false;
    }
  }
}
