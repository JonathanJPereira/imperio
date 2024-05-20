import 'package:mobx/mobx.dart';

part 'tab_selector_store.g.dart';

class TabSelectorStore = _TabSelectorStore with _$TabSelectorStore;

abstract class _TabSelectorStore with Store {
  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }
}
