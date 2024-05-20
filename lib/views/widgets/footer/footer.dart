import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Divider(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.09),
                thickness: 1,
              ),
              Expanded(
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 150,
        )
      ],
    );
  }
}
