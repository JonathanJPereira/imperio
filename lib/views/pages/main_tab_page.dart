import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/navigation_store.dart';
import 'package:imperio/utils/imperio_icons.dart';
import 'package:imperio/utils/service_locator.dart';
import 'package:imperio/views/pages/main_upper_tab_page.dart';
import 'package:imperio/views/pages/sports_page.dart';
import 'package:imperio/views/widgets/nav_bar/nav_bar.dart';
import 'package:imperio/views/widgets/nav_bar/nav_item.dart';

class MainTabPage extends StatelessWidget {
  final NavigationStore store = getIt<NavigationStore>();

  MainTabPage({super.key});

  static final List<Widget> _widgetOptions = <Widget>[
    MainUpperTabPage(),
    SportsPage(),
    Text('Página 3'),
  ];

  static final List<NavItem> _navItems = [
    NavItem(
      icon: ImperioIcons.iconHomeOutline,
      selectedIcon: ImperioIcons.iconHome,
      index: 0,
    ),
    NavItem(
      icon: ImperioIcons.iconWhistleOutline,
      selectedIcon: ImperioIcons.iconWhistle,
      index: 1,
    ),
    NavItem(
      icon: ImperioIcons.iconBookmarkOutline,
      selectedIcon: ImperioIcons.iconBookmark,
      index: 2,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Observer(
            builder: (_) => Center(
              child: _widgetOptions.elementAt(store.selectedIndex),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Observer(
              builder: (_) => NavBar(
                navItems: _navItems,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
