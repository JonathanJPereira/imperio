import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/dot_indicator.dart';

class LiveIndicator extends StatelessWidget {
  const LiveIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            const Positioned(
              right: 0,
              top: 0,
              child: DotIndicator(size: 6),
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
