import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/match_list/match_list.dart';
import 'package:imperio/views/widgets/popular_championships/popular_championships.dart';
import 'package:imperio/views/widgets/sport_banner/sports_banner.dart';

class AllSports extends StatelessWidget {
  const AllSports({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SportsBanner(),
          const PopularChampionships(),
          MatchList(),
        ],
      ),
    );
  }
}
