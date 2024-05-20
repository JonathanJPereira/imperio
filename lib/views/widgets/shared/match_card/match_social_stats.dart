import 'package:flutter/material.dart';
import 'package:imperio/utils/imperio_icons.dart';
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
          _buildStatItem(ImperioIcons.iconThumbsUp, likeCount),
          _buildStatItem(ImperioIcons.iconStar, starCount),
          _buildStatItem(ImperioIcons.iconShareOutline, shareCount),
          _buildStatItem(ImperioIcons.iconEye, viewCount),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, int count) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(NumberFormat.compact().format(count)),
      ],
    );
  }
}
