import 'package:flutter/material.dart';
import 'package:imperio/models/match_conflict.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';
import 'package:intl/intl.dart';

class MatchConflictCard extends StatelessWidget {
  final MatchConflict conflict;
  final String teamAImg;
  final String teamBImg;

  const MatchConflictCard({
    super.key,
    required this.conflict,
    required this.teamAImg,
    required this.teamBImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 264,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomNetworkImage(
                imgUrl: conflict.championshipImage,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(
                conflict.championshipName,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomNetworkImage(
                imgUrl: teamAImg,
                width: 37.5,
                height: 37.5,
              ),
              Column(
                children: [
                  const Text(
                    '2 X 2',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(conflict.date),
                    style: const TextStyle(fontSize: 10),
                  )
                ],
              ),
              CustomNetworkImage(
                imgUrl: teamBImg,
                width: 37.5,
                height: 37.5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
