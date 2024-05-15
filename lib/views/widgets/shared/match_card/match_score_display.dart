import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MatchScoreDisplay extends StatelessWidget {
  final int scoreTeamOne;
  final int scoreTeamTwo;

  const MatchScoreDisplay({
    super.key,
    required this.scoreTeamOne,
    required this.scoreTeamTwo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FittedBox(
      fit: BoxFit.contain,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(NumberFormat.compact().format(scoreTeamOne),
                style: const TextStyle(fontSize: 50)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(':',
                  style: TextStyle(
                      fontSize: 40,
                      color: theme.colorScheme.tertiary.withOpacity(0.6))),
            ),
            Text(NumberFormat.compact().format(scoreTeamTwo),
                style: const TextStyle(fontSize: 50)),
          ],
        ),
      ),
    );
  }
}
