import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/sports_store.dart';
import 'package:imperio/utils/service_locator.dart';
import 'package:imperio/views/widgets/gradient_background.dart';
import 'package:imperio/views/widgets/upper_tab_bar.dart';
import 'package:imperio/views/widgets/upper_tab_button.dart';

class MainTabController extends StatefulWidget {
  const MainTabController({super.key});

  @override
  State<MainTabController> createState() => _MainTabControllerState();
}

class _MainTabControllerState extends State<MainTabController> {
  final SportsStore store = getIt<SportsStore>();

  @override
  void initState() {
    super.initState();
    store.fetchSports();
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
          bottom: UpperTabBar(tabs: buildTabs()),
        ),
      ),
    );
  }

  List<Widget> buildTabs() {
    return [
      const UpperTabButton(
          icon: IconData(0xe800, fontFamily: 'sport'), text: 'Todos'),
      ...store.sports.map((sport) =>
          UpperTabButton(icon: Icons.sports_soccer, text: sport.name))
    ];
  }

  Widget buildBody() {
    return Stack(
      children: [
        const GradientBackground(),
        Observer(
          builder: (_) => TabBarView(children: [
            Center(
              child: Text(
                store.sports.length.toString(),
              ),
            ),
          ]),
        ),
      ],
    );
  }

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
}
