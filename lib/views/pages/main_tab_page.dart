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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuButton(context),
                _buildNavBar(),
                _buildProfilePicture()
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(14),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          foregroundColor: Colors.white.withOpacity(0.9)),
      child: const Icon(Icons.menu),
    );
  }

  Widget _buildNavBar() {
    return RoundedNavBar(
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
    );
  }

  Widget _buildProfilePicture() {
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
