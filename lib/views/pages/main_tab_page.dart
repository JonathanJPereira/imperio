import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/navigation/navigation_store.dart';
import 'package:imperio/config/service_locator.dart';
import 'package:imperio/views/widgets/nav_bar/rounded_destination.dart';
import 'package:imperio/views/widgets/nav_bar/rounded_nav_bar.dart';

class MainTabPage extends StatelessWidget {
  final NavigationStore store = getIt<NavigationStore>();

  MainTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Observer(
        builder: (_) => Center(child: store.currentPage),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => buildBottomNavigationBar(context),
      ),
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildMenuButton(context),
            buildNavBar(),
            buildProfilePicture()
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(BuildContext context) {
    return ElevatedButton(
      onPressed: store.toggleMenu,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(14),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Colors.white.withOpacity(0.9),
        minimumSize: Size.zero,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        child: Icon(
          store.menuIsOpen ? Icons.close : Icons.menu,
          key: ValueKey<bool>(store.menuIsOpen),
          size: 25,
        ),
      ),
    );
  }

  Widget buildNavBar() {
    return RoundedNavBar(
      destinations: List.generate(
          store.navItems.where((item) => item.tabBarItem).length, (index) {
        final item = store.navItems[index];
        return RoundedDestination(
            id: item.id,
            icon: item.icon,
            selectedIcon: item.selectedIcon,
            selected: store.selectedItemId == item.id);
      }),
      onItemSelected: store.setSelectedItem,
    );
  }

  Widget buildProfilePicture() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/images/perfil.png'),
      ),
    );
  }
}
