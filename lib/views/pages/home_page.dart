import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            title: SvgPicture.asset(
              'assets/images/logo.svg',
              height: 25,
            ),
            backgroundColor: const Color(0xFFFBF5CA),
            elevation: 0,
          ),
        ),
        body: Stack(
          children: [
            const GradientBackground(),
            SizedBox(
              height: 166,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 270,
                    color: Colors.red,
                    child: Center(child: Text("Container 1")),
                  ),
                  Container(
                    width: 270,
                    color: Colors.blue,
                    child: Center(child: Text("Container 2")),
                  ),
                  Container(
                    width: 270,
                    color: Colors.green,
                    child: Center(child: Text("Container 3")),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFBF5CA), Colors.white],
        ),
      ),
    );
  }
}
