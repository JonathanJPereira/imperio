import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imperio/stores/sports/sports_store.dart';
import 'package:imperio/utils/imperio_icons.dart';
import 'package:imperio/config/service_locator.dart';
import 'package:imperio/views/pages/all_sports_page.dart';
import 'package:imperio/views/widgets/upper_tab_bar/upper_tab_bar.dart';
import 'package:imperio/views/widgets/upper_tab_bar/upper_tab_button.dart';

class MainUpperTabPage extends StatelessWidget {
  final SportsStore store = getIt<SportsStore>();

  MainUpperTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return DefaultTabController(
        length: store.sports.length + 1,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                _buildSliverAppBar(),
              ];
            },
            body: _buildTabBarView(),
          ),
        ),
      );
    });
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      title: SvgPicture.asset('assets/images/logo.svg', height: 25),
      centerTitle: true,
      floating: true,
      snap: false,
      bottom: UpperTabBar(tabs: _buildTabs()),
    );
  }

  List<Widget> _buildTabs() {
    return [
      const UpperTabButton(
          icon: ImperioIcons.iconWhistleDetailed, text: 'Todos'),
      ...store.sports.map((sport) =>
          UpperTabButton(icon: Icons.sports_soccer, text: sport.name))
    ];
  }

  Widget _buildTabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const AllSportsPage(),
        ...store.sports.map((sport) => Center(child: Text(sport.name)))
      ],
    );
  }
}
