import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/navigation_store.dart';
import 'package:imperio/utils/service_locator.dart';

class NavItem extends StatelessWidget {
  final NavigationStore store = getIt<NavigationStore>();
  final IconData icon;
  final IconData selectedIcon;
  final int index;

  NavItem({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(builder: (context) {
        return InkWell(
          onTap: () {
            store.setIndex(index);
          },
          child: Container(
            width: 67,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: store.selectedIndex == index
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.black,
            ),
            child: Icon(
              store.selectedIndex == index ? selectedIcon : icon,
              color: store.selectedIndex == index
                  ? Colors.black
                  : Colors.white.withOpacity(0.9),
              size: 24,
            ),
          ),
        );
      }),
    );
  }
}
