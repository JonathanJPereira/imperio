import 'package:flutter/material.dart';

class SportBannerCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color color;
  final String imagePath;

  const SportBannerCard({
    required this.title,
    required this.color,
    required this.imagePath,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 142,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Monteserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                if (subtitle != null)
                  SizedBox(
                    width: 165,
                    child: Text(
                      subtitle!,
                      style: TextStyle(
                        fontFamily: 'Monteserrat',
                        fontSize: 14,
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(0.7),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              imagePath,
            ),
          )
        ],
      ),
    );
  }
}
