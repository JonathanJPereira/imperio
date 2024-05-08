import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/nav_bar/nav_item.dart';

class NavBar extends StatelessWidget {
  final List<NavItem> navItems;

  const NavBar({super.key, required this.navItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SafeArea(
          bottom: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildMenuButton(context),
              _buildNavBarRow(),
              _buildProfilePicture(),
            ],
          ),
        ),
      ],
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

  Widget _buildNavBarRow() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        color: Colors.black,
      ),
      padding: const EdgeInsets.all(9),
      margin: EdgeInsets.zero,
      width: 209,
      child: Row(
        children: navItems,
      ),
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
