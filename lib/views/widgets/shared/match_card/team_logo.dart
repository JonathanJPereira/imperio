import 'package:flutter/material.dart';

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
