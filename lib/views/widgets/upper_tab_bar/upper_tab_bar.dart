import 'package:flutter/material.dart';

class UpperTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;

  const UpperTabBar({required this.tabs, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelColor: Theme.of(context).colorScheme.tertiary,
      unselectedLabelColor:
          Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.tertiary,
          width: 4.0,
        ),
        insets: const EdgeInsets.symmetric(horizontal: 15),
        borderRadius: BorderRadius.circular(30),
      ),
      dividerColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.09),
      tabs: tabs,
    );
  }
}
