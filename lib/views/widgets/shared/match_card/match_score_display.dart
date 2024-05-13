import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text('$scoreTeamOne', style: const TextStyle(fontSize: 50)),
          Text(':',
              style: TextStyle(
                  fontSize: 40,
                  color: theme.colorScheme.tertiary.withOpacity(0.6))),
          Text('$scoreTeamTwo', style: const TextStyle(fontSize: 50)),
        ],
      ),
    );
  }
}
