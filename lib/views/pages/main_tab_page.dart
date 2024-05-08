import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/navigation_store.dart';
import 'package:imperio/utils/service_locator.dart';
import 'package:imperio/views/pages/main_upper_tab_page.dart';

class MainTabPage extends StatelessWidget {
  final NavigationStore store = getIt<NavigationStore>();

  MainTabPage({super.key});

  static final List<Widget> _widgetOptions = <Widget>[
    MainUpperTabPage(),
    Text('Página 2'),
    Text('Página 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => Center(
          child: _widgetOptions.elementAt(store.selectedIndex),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Negócios',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Escola',
            ),
          ],
          currentIndex: store.selectedIndex,
          onTap: (index) => store.setIndex(index),
        ),
      ),
    );
  }
}
