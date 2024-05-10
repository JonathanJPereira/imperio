import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';

class PopularChampionshipCard extends StatelessWidget {
  const PopularChampionshipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: const Center(
        child: CustomNetworkImage(imgUrl: 'https://loremflickr.com/640/480/sports'),
      ),
    );
  }
}
