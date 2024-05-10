import 'package:flutter/material.dart';
import 'package:imperio/models/nav_item.dart';
import 'package:imperio/utils/imperio_icons.dart';
import 'package:imperio/views/pages/main_upper_tab_page.dart';
import 'package:imperio/views/pages/menu_page.dart';
import 'package:imperio/views/pages/sports_page.dart';
import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  ObservableList<NavItem> navItems = ObservableList.of([
    NavItem(
      id: "home",
      label: "Início",
      icon: ImperioIcons.iconHomeOutline,
      selectedIcon: ImperioIcons.iconHome,
      page: MainUpperTabPage(),
    ),
    NavItem(
      id: "sports",
      label: "Esportes",
      icon: ImperioIcons.iconWhistleOutline,
      selectedIcon: ImperioIcons.iconWhistle,
      page: SportsPage(),
    ),
    NavItem(
      id: "news_tips",
      label: "Notícias e Dicas",
      icon: ImperioIcons.iconBookmarkOutline,
      selectedIcon: ImperioIcons.iconBookmark,
      page: const Text('Notícias e Dicas'),
    ),
    NavItem(
      id: "favorites",
      label: "Favoritos",
      icon: ImperioIcons.iconStarOutline,
      selectedIcon: ImperioIcons.iconStarOutline,
      page: const Text('Favoritos'),
    ),
    NavItem(
      id: "influencers",
      label: "Influenciadores",
      icon: ImperioIcons.iconPeoplesOutline,
      selectedIcon: ImperioIcons.iconPeoplesOutline,
      page: const Text('Influenciadores'),
    ),
    NavItem(
      id: "odds_comparator",
      label: "Comparador de odds",
      icon: ImperioIcons.iconPieOutline,
      selectedIcon: ImperioIcons.iconPieOutline,
      page: const Text('Comparador de odds'),
    ),
    NavItem(
      id: "responsible_gaming",
      label: "Jogo consciente",
      icon: ImperioIcons.iconTicketOutline,
      selectedIcon: ImperioIcons.iconTicketOutline,
      page: const Text('Jogo consciente'),
    ),
    NavItem(
      id: "privacy_security",
      label: "Privacidade e segurança",
      icon: ImperioIcons.iconShieldOutline,
      selectedIcon: ImperioIcons.iconShieldOutline,
      page: const Text('Privacidade e segurança'),
    ),
  ]);

  @observable
  String searchText = '';

  @computed
  List<NavItem> get filteredItems {
    if (searchText.isEmpty) {
      return navItems.toList();
    } else {
      return navItems
          .where((item) =>
              item.label.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  @observable
  String selectedItemId = 'home';

  @observable
  bool menuIsOpen = false;

  @observable
  bool isSearchOpen = false;

  @computed
  Widget get currentPage => menuIsOpen
      ? MenuPage()
      : navItems.firstWhere((item) => item.id == selectedItemId).page;

  @action
  void setSelectedItem(String id) {
    if(navItems.any((item) => item.id == id)) {
      menuIsOpen = false;
      isSearchOpen = false;
      selectedItemId = id;
    }
  }
 
  @action
  void toggleMenu() {
    menuIsOpen = !menuIsOpen;
  }

  @action
  void toggleSearch() {
    isSearchOpen = !isSearchOpen;
  }

  @action
  void setSearchText(String text) {
    searchText = text;
  }

  @action
  void clearSearch() {
    searchText = '';
    isSearchOpen = false;
  }
}
