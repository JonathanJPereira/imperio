import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';
import 'package:intl/intl.dart';

class BetCard extends StatelessWidget {
  final String userAvatar;
  final String user;
  final String platform;
  final double score;

  const BetCard({
    required this.userAvatar,
    required this.user,
    required this.platform,
    required this.score,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomNetworkImage(
              imgUrl: userAvatar,
              width: 40,
              height: 40,
              boxFit: BoxFit.cover,
              borderRadius: BorderRadius.circular(100),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user, style: const TextStyle(fontSize: 14)),
                Text(platform,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700)),
                const Text('BRA X ARG', style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Image.asset('assets/images/betting_houses/bet365.png',
                    width: 35),
                Text(
                  NumberFormat.compact().format(score),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
