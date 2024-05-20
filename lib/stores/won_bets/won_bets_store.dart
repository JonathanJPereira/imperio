import 'package:imperio/models/won_bet/won_bet.dart';
import 'package:imperio/services/won_bets_service.dart';
import 'package:mobx/mobx.dart';

part 'won_bets_store.g.dart';

class WonBetsStore = _WonBetsStore with _$WonBetsStore;

abstract class _WonBetsStore with Store {
  final WonBetsService _wonBetsService;

  _WonBetsStore(this._wonBetsService) {
    fetchWonBets().then((value) => print(wonBets));
  }

  @observable
  ObservableList<WonBet> wonBets = ObservableList<WonBet>();

  @action
  Future<void> fetchWonBets() async {
    try {
      final wonBetsList = await _wonBetsService.fetchWonBets();
      wonBets = ObservableList<WonBet>.of(wonBetsList);
    } catch (e) {
      print(e.toString());
    }
  }
}
