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
        indicator: _buildIndicator(context),
        dividerColor: const Color(0xFFEFEFEF),
        tabs: tabs,
      ),
    );
  }

  Decoration _buildIndicator(BuildContext context) {
    return UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 4.0,
      ),
      insets: const EdgeInsets.symmetric(horizontal: 15),
      borderRadius: BorderRadius.circular(30),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}