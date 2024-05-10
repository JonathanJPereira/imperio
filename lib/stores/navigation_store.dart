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
      label: "Início",
      icon: ImperioIcons.iconHomeOutline,
      selectedIcon: ImperioIcons.iconHome,
      page: MainUpperTabPage(),
    ),
    NavItem(
      label: "Esportes",
      icon: ImperioIcons.iconWhistleOutline,
      selectedIcon: ImperioIcons.iconWhistle,
      page: SportsPage(),
    ),
    NavItem(
      label: "Notícias e Dicas",
      icon: ImperioIcons.iconBookmarkOutline,
      selectedIcon: ImperioIcons.iconBookmark,
      page: const Text('Notícias e Dicas'),
    ),
    NavItem(
      label: "Favoritos",
      icon: ImperioIcons.iconStarOutline,
      selectedIcon: ImperioIcons.iconStarOutline,
      page: const Text('Favoritos'),
    ),
    NavItem(
      label: "Influenciadores",
      icon: ImperioIcons.iconPeoplesOutline,
      selectedIcon: ImperioIcons.iconPeoplesOutline,
      page: const Text('Influenciadores'),
    ),
    NavItem(
      label: "Comparador de odds",
      icon: ImperioIcons.iconPieOutline,
      selectedIcon: ImperioIcons.iconPieOutline,
      page: const Text('Comparador de odds'),
    ),
    NavItem(
      label: "Jogo consciente ",
      icon: ImperioIcons.iconTicketOutline,
      selectedIcon: ImperioIcons.iconTicketOutline,
      page: const Text('Jogo consciente'),
    ),
    NavItem(
      label: "Privacidade e segurança ",
      icon: ImperioIcons.iconShieldOutline,
      selectedIcon: ImperioIcons.iconShieldOutline,
      page: const Text('Privacidade e segurança'),
    ),
  ]);

  @observable
  int selectedIndex = 0;

  @observable
  bool menuIsOpen = false;

  @computed
  Widget get currentPage =>
      menuIsOpen ? MenuPage() : navItems[selectedIndex].page;

  @action
  void setIndex(int index) {
    menuIsOpen = false;
    selectedIndex = index;
  }

  @action
  void toggleMenu() {
    menuIsOpen = !menuIsOpen;
  }
}
