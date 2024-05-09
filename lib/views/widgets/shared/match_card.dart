import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: const Color(0xFFDEE0DF)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const TeamLogo(name: 'São Paulo'),
              LiveIndicator(theme: theme),
              const TeamLogo(name: 'Palmeiras'),
            ],
          ),
          MatchScoreDisplay(theme: theme, scoreTeamOne: 2, scoreTeamTwo: 2),
          const TimeLine(),
        ],
      ),
    );
  }
}

class TimeLine extends StatelessWidget {
  const TimeLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('0'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              children: [
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Text('90'),
      ],
    );
  }
}

class MatchScoreDisplay extends StatelessWidget {
  final ThemeData theme;
  final int scoreTeamOne;
  final int scoreTeamTwo;

  const MatchScoreDisplay({
    super.key,
    required this.theme,
    required this.scoreTeamOne,
    required this.scoreTeamTwo,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
      ),
    );
  }
}

class TeamLogo extends StatelessWidget {
  final String name;
  const TeamLogo({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 61.5,
            width: 61.5,
            child: Center(
              child: SizedBox(
                height: 37.5,
                width: 37.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://loremflickr.com/640/480/sports',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class LiveIndicator extends StatelessWidget {
  final ThemeData theme;
  const LiveIndicator({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 6, left: 6),
              child: Text(
                'Ao vivo',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.tertiary.withOpacity(0.6)),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFDEE0DF)),
              borderRadius: BorderRadius.circular(100)),
          child: const Text(
            '60’',
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
