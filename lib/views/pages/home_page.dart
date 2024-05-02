import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/sports_store.dart';
import 'package:imperio/utils/service_locator.dart';
import 'package:imperio/views/widgets/gradient_background.dart';
import 'package:imperio/views/widgets/upper_tab_bar.dart';
import 'package:imperio/views/widgets/upper_tab_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final SportsStore store = getIt<SportsStore>();

  @override
  Widget build(BuildContext context) {
    store.fetchSports();

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
      child: Observer(
        builder: (_) => AppBar(
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/images/logo.svg',
            height: 25,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          bottom: UpperTabBar(tabs: [
            const UpperTabButton(icon: Icons.home, text: 'Todos'),
            ...store.sports.map(
                (sport) => UpperTabButton(icon: Icons.home, text: sport.name))
          ]),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Observer(
      builder: (_) => Stack(
        children: [
          const GradientBackground(),
          TabBarView(
            children: [
              buildPageContent(store.sports.length.toString()),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPageContent(String text) {
    return Center(
      child: Text(text),
    );
  }
}
