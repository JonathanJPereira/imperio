import 'package:flutter/material.dart';

class UpperTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;

  const UpperTabBar({
    required this.tabs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: TabBar(
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        labelColor: Theme.of(context).colorScheme.secondary,
        unselectedLabelColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 4,
          ),
          insets: const EdgeInsets.symmetric(horizontal: 15),
        ),
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48);
}
