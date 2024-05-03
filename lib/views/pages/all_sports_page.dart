import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/sport_banner_card.dart';

class AllSports extends StatelessWidget {
  const AllSports({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: const Column(
        children: [
          SportsBanner(),
        ],
      ),
    );
  }
}

class SportsBanner extends StatelessWidget {
  const SportsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 166,
      child: ListView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SportBannerCard(
            title: "Campeonatos populares",
            color: Theme.of(context).colorScheme.secondary,
            imagePath: 'assets/images/football_player.png',
          ),
          const SizedBox(
            width: 25,
          ),
          const SportBannerCard(
            title: "NBA",
            color: Color(0xFFC0C4C2),
            imagePath: 'assets/images/basketball_player.png',
            subtitle: 'National Basketball Association',
          ),
          const SizedBox(
            width: 25,
          ),
          const SportBannerCard(
            title: "League\nof its Own",
            color: Color(0xFFF2ECCB),
            imagePath: 'assets/images/league_of_its_own.png',
          ),
        ],
      ),
    );
  }
}
