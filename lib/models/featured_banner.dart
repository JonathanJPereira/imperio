import 'package:flutter/material.dart';

class FeaturedBanner {
  final String title;
  final Color color;
  final String imagePath;
  final String? subtitle;

  FeaturedBanner(
      {required this.title,
      required this.color,
      required this.imagePath,
      this.subtitle});
}
