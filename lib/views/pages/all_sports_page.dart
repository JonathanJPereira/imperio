import 'package:flutter/material.dart';

class AllSports extends StatelessWidget {
  const AllSports({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 166,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 270,
            height: 166, // Define a altura aqui
            color: Colors.red,
            child: Center(child: Text("Container 1")),
          ),
          Container(
            width: 270,
            height: 166, // E aqui
            color: Colors.blue,
            child: Center(child: Text("Container 2")),
          ),
          Container(
            width: 270,
            height: 166, // E aqui também
            color: Colors.green,
            child: Center(child: Text("Container 3")),
          ),
        ],
      ),
    );
  }
}
