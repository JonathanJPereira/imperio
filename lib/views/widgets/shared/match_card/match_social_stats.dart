import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MatchSocialStats extends StatelessWidget {
  final int likeCount;
  final int starCount;
  final int shareCount;
  final int viewCount;

  const MatchSocialStats({
    super.key,
    required this.likeCount,
    required this.starCount,
    required this.shareCount,
    required this.viewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(Icons.thumb_up, likeCount),
          _buildStatItem(Icons.star, starCount),
          _buildStatItem(Icons.refresh, shareCount),
          _buildStatItem(Icons.visibility, viewCount),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, int count) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 4),
        Text(NumberFormat.compact().format(count)),
      ],
    );
  }
}
