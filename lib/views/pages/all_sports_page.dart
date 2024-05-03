import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/sport_banner/sports_banner.dart';

class AllSports extends StatelessWidget {
  const AllSports({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SportsBanner(),
          Text('Teste'),
        ],
      ),
    );
  }
}
