import 'package:flutter/material.dart';

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
      child: Center(
        child: SizedBox(
          width: 45,
          height: 44,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://loremflickr.com/640/480/sports',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
