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
      margin: const EdgeInsets.only(right: 25),
      width: 270,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildTextContent(context),
          _buildImage(),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: _titleStyle(),
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(
                  top:
                      10), // Adiciona um pequeno espaçamento se o subtítulo estiver presente
              child: Text(
                subtitle!,
                style: _subtitleStyle(context),
              ),
            ),
        ],
      ),
    );
  }

  TextStyle _titleStyle() {
    return const TextStyle(
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w700,
      fontSize: 18,
    );
  }

  TextStyle _subtitleStyle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Monteserrat',
      fontSize: 14,
      color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
    );
  }

  Widget _buildImage() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Image.asset(
        imagePath,
      ),
    );
  }
}
