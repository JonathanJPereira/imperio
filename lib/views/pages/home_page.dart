import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imperio/views/widgets/gradient_background.dart';
import 'package:imperio/views/widgets/upper_tab_bar.dart';
import 'package:imperio/views/widgets/upper_tab_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: buildBody(),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 25,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        bottom: const UpperTabBar(
          tabs: [
            UpperTabButton(icon: Icons.home, text: 'Todos'),
            UpperTabButton(icon: Icons.home, text: 'Todos'),
            UpperTabButton(icon: Icons.star, text: 'Favorites'),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Stack(
      children: [
        const GradientBackground(),
        TabBarView(
          children: [
            buildPageContent("Home Page Content"),
            buildPageContent("Favorites Page Content"),
            buildPageContent("Settings Page Content"),
          ],
        ),
      ],
    );
  }

  Widget buildPageContent(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
