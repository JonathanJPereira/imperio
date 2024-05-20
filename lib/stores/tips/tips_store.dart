import 'package:imperio/models/tip/tip.dart';
import 'package:imperio/services/tips_service.dart';
import 'package:mobx/mobx.dart';

part 'tips_store.g.dart';

class TipsStore = _TipsStore with _$TipsStore;

abstract class _TipsStore with Store {
  final TipsService _tipsService;

  _TipsStore(this._tipsService) {
    fetchTips();
  }

  @observable
  ObservableList<Tip> tips = ObservableList<Tip>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchTips() async {
    isLoading = true;
    errorMessage = null;
    try {
      final tipsList = await _tipsService.fetchTips();
      tips = ObservableList<Tip>.of(tipsList);
    } catch (error) {
      errorMessage = 'Failed to load tips: $error';
    } finally {
      isLoading = false;
    }
  }
}
