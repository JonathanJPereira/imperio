import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/nav_bar/rounded_destination.dart';

class RoundedNavBar extends StatelessWidget {
  final List<RoundedDestination> destinations;
  final Function(String) onItemSelected;

  const RoundedNavBar(
      {super.key, required this.destinations, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: Colors.black,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: destinations.map((destination) {
              return GestureDetector(
                onTap: () => onItemSelected(destination.id),
                child: destination,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
