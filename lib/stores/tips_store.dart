import 'package:imperio/models/tip.dart';
import 'package:imperio/services/tips_service.dart';
import 'package:mobx/mobx.dart';

part 'tips_store.g.dart';

class TipsStore = _TipsStore with _$TipsStore;

abstract class _TipsStore with Store {
  final TipsService _tipsService;

  _TipsStore(this._tipsService);

  @observable
  ObservableList<Tip> tips = ObservableList<Tip>();

  @action
  Future<void> fetchTips() async {
    try {
      final tipsList = await _tipsService.fetchTips();
      tips = ObservableList<Tip>.of(tipsList);
    } catch (error) {
      throw Exception('Failed to load tips: $error');
    }
  }
}
