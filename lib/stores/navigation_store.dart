import 'package:flutter/material.dart';
import 'package:imperio/models/nav_item.dart';
import 'package:imperio/utils/imperio_icons.dart';
import 'package:imperio/views/pages/main_upper_tab_page.dart';
import 'package:imperio/views/pages/sports_page.dart';
import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  ObservableList<NavItem> navItems = ObservableList.of([
    NavItem(
      label: "Home",
      icon: ImperioIcons.iconHomeOutline,
      selectedIcon: ImperioIcons.iconHome,
      page: MainUpperTabPage(),
    ),
    NavItem(
      label: "Sports",
      icon: ImperioIcons.iconWhistleOutline,
      selectedIcon: ImperioIcons.iconWhistle,
      page: SportsPage(),
    ),
    NavItem(
      label: "Bookmark",
      icon: ImperioIcons.iconBookmarkOutline,
      selectedIcon: ImperioIcons.iconBookmark,
      page: Text('Profile Page'),
    ),
  ]);

  @observable
  int selectedIndex = 0;

  @computed
  Widget get currentPage => navItems[selectedIndex].page;

  @action
  void setIndex(int index) {
    selectedIndex = index;
  }
}
