import 'package:flutter/material.dart';
import 'package:imperio/models/featured_banner.dart';
import 'package:imperio/views/widgets/shared/horizontal_list.dart';
import 'package:imperio/views/widgets/sport_banner/sport_banner_card.dart';

class SportsBanner extends StatelessWidget {
  final List<FeaturedBanner> banners = [
    FeaturedBanner(
        title: "Campeonatos populares",
        color: const Color(0xFFF5D70A),
        imagePath: "assets/images/football_player.png"),
    FeaturedBanner(
        title: "NBA",
        color: const Color(0xFFC0C4C2),
        imagePath: "assets/images/basketball_player.png",
        subtitle: "National Basketball Association"),
    FeaturedBanner(
        title: "League\nof its Own",
        color: const Color(0xFFF2ECCB),
        imagePath: "assets/images/league_of_its_own.png"),
  ];

  SportsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final sportBanners = [
      ...banners.map(
        (banner) => SportBannerCard(
          title: banner.title,
          subtitle: banner.subtitle,
          color: banner.color,
          imagePath: banner.imagePath,
        ),
      )
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: HorizontalList(
        height: 160,
        itemCount: sportBanners.length,
        itemBuilder: (context, index) {
          return sportBanners[index];
        },
      ),
    );
  }
}
