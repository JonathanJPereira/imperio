import 'package:flutter/material.dart';
import 'package:imperio/models/championship/championship.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';

class PopularChampionshipCard extends StatelessWidget {
  final Championship championship;

  const PopularChampionshipCard({super.key, required this.championship});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Center(
        child: CustomNetworkImage(imgUrl: championship.image),
      ),
    );
  }
}
