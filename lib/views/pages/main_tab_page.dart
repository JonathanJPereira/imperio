import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/navigation_store.dart';
import 'package:imperio/utils/service_locator.dart';
import 'package:imperio/views/widgets/nav_bar/rounded_destination.dart';
import 'package:imperio/views/widgets/nav_bar/rounded_nav_bar.dart';

class MainTabPage extends StatelessWidget {
  final NavigationStore store = getIt<NavigationStore>();

  MainTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Observer(
            builder: (_) => Center(
              child: store.currentPage,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Observer(builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
            child: RoundedNavBar(
              destinations: [
                ...List.generate(store.navItems.length, (index) {
                  return RoundedDestination(
                    icon: store.navItems[index].icon,
                    selectedIcon: store.navItems[index].selectedIcon,
                    selected: store.selectedIndex == index,
                  );
                })
              ],
              onItemSelected: (index) {
                store.setIndex(index);
              },
            ),
          ),
        );
      }),
    );
  }
}
