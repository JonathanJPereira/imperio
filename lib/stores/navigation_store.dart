import 'package:flutter/material.dart';
import 'package:imperio/models/nav_item.dart';
import 'package:imperio/utils/imperio_icons.dart';
import 'package:imperio/utils/remove_diacritics.dart';
import 'package:imperio/views/pages/main_upper_tab_page.dart';
import 'package:imperio/views/pages/menu_page.dart';
import 'package:imperio/views/pages/placeholder_page.dart';
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
      tabBarItem: true,
    ),
    NavItem(
      id: "sports",
      label: "Esportes",
      icon: ImperioIcons.iconWhistleOutline,
      selectedIcon: ImperioIcons.iconWhistle,
      page: SportsPage(),
      tabBarItem: true,
    ),
    NavItem(
      id: "news_tips",
      label: "Notícias e Dicas",
      icon: ImperioIcons.iconBookmarkOutline,
      selectedIcon: ImperioIcons.iconBookmark,
      page: const PlaceholderPage(message: 'Notícias e Dicas'),
      tabBarItem: true,
    ),
    NavItem(
      id: "favorites",
      label: "Favoritos",
      icon: ImperioIcons.iconStarOutline,
      selectedIcon: ImperioIcons.iconStarOutline,
      page: const PlaceholderPage(message: 'Favoritos'),
    ),
    NavItem(
      id: "influencers",
      label: "Influenciadores",
      icon: ImperioIcons.iconPeoplesOutline,
      selectedIcon: ImperioIcons.iconPeoplesOutline,
      page: const PlaceholderPage(message: 'Influenciadores'),
    ),
    NavItem(
      id: "odds_comparator",
      label: "Comparador de odds",
      icon: ImperioIcons.iconPieOutline,
      selectedIcon: ImperioIcons.iconPieOutline,
      page: const PlaceholderPage(message: 'Comparador de odds'),
    ),
    NavItem(
      id: "responsible_gaming",
      label: "Jogo consciente",
      icon: ImperioIcons.iconTicketOutline,
      selectedIcon: ImperioIcons.iconTicketOutline,
      page: const PlaceholderPage(message: 'Jogo consciente'),
    ),
    NavItem(
      id: "privacy_security",
      label: "Privacidade e segurança",
      icon: ImperioIcons.iconShieldOutline,
      selectedIcon: ImperioIcons.iconShieldOutline,
      page: const PlaceholderPage(message: 'Privacidade e segurança'),
    ),
  ]);

  @observable
  String _searchText = '';

  @computed
  List<NavItem> get filteredItems {
    if (_searchText.isEmpty) {
      return navItems.toList();
    } else {
      return navItems.where((item) {
        return normalizeText(item.label).contains(normalizeText(_searchText));
      }).toList();
    }
  }

  String normalizeText(String text) {
    return removeDiacritics(text.toLowerCase());
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
    selectedItemId = id;
    menuIsOpen = false;
    isSearchOpen = false;
    clearSearch();
  }

  @action
  void toggleMenu() {
    menuIsOpen = !menuIsOpen;
  }

  @action
  void toggleSearch() {
    isSearchOpen = !isSearchOpen;
    if (!isSearchOpen) {
      clearSearch();
    }
  }

  @action
  void setSearchText(String text) {
    _searchText = text;
  }

  @action
  void clearSearch() {
    _searchText = '';
    isSearchOpen = false;
  }
}
