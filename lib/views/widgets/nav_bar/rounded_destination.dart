import 'package:flutter/material.dart';

class RoundedDestination extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final bool selected;

  const RoundedDestination({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: 67,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: selected
            ? Theme.of(context).colorScheme.secondary
            : Colors.transparent,
      ),
      child: Icon(
        selected ? selectedIcon : icon,
        color: selected ? Colors.black : Colors.white.withOpacity(0.9),
      ),
    );
  }
}
