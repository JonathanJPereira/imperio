import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class BetCard extends StatelessWidget {
  final String userAvatar;
  final String user;
  final String platform;
  final DateTime date;
  final double score;

  const BetCard({
    required this.userAvatar,
    required this.user,
    required this.platform,
    required this.score,
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserAvatar(imageUrl: userAvatar),
            const SizedBox(width: 10),
            UserInfo(user: user, platform: platform, date: date),
            const SizedBox(width: 10),
            BettingInfo(score: score),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String imageUrl;

  const UserAvatar({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imgUrl: imageUrl,
      width: 40,
      height: 40,
      boxFit: BoxFit.cover,
      borderRadius: BorderRadius.circular(100),
    );
  }
}

class UserInfo extends StatelessWidget {
  final String user;
  final String platform;
  final DateTime date;

  const UserInfo({
    super.key,
    required this.user,
    required this.platform,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(user, style: const TextStyle(fontSize: 14)),
        SizedBox(
          width: 170,
          child: Text(
            platform,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Text(
          timeago.format(date, locale: 'pt_BR'),
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}

class BettingInfo extends StatelessWidget {
  final double score;

  const BettingInfo({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/betting_houses/bet365.png', width: 35),
        Text(
          NumberFormat.compact().format(score),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
