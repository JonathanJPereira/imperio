import 'package:flutter/material.dart';
import 'package:imperio/models/tip/tip.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';

class TipCard extends StatelessWidget {
  final Tip tip;

  const TipCard({
    required this.tip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            imgUrl: tip.image,
            width: double.infinity,
            height: 141.5,
            boxFit: BoxFit.cover,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tip.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Text(
                  tip.description,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoryChip(
                        icon: Icons.sports_soccer,
                        label: 'Futebol',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CategoryChip(
                        icon: Icons.sports_basketball,
                        label: 'Basquete',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryChip({
    required this.icon,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: Theme.of(context).colorScheme.tertiary),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Theme.of(context).colorScheme.tertiary),
          const SizedBox(width: 3),
          Text(
            label,
            style: const TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
