import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/tab_selector_store.dart';
import 'package:imperio/views/widgets/shared/match_card/betting_houses_display.dart';
import 'package:imperio/views/widgets/tab_selector/tab_selector.dart';

class OddDraggableSheet extends StatelessWidget {
  final TabSelectorStore tabSelectorStore = GetIt.I<TabSelectorStore>();

  OddDraggableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tabViews = [
      const BettingHousesDisplay(
        onexbetOdd: 3.4,
        betsafeOdd: 2.4,
        betssonOdd: 3.5,
        colorDivisor: Color(0xFF646E69),
      ),
      const Text('Amanhã'),
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  height: 6.0,
                  width: 53.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                Observer(builder: (context) {
                  return TabSelector(
                    store: tabSelectorStore,
                    tabs: const ['Odds mais altas', 'Outras odds'],
                    borderColor: const Color(0xFF646E69),
                  );
                }),
                Observer(
                  builder: (_) => IndexedStack(
                    index: tabSelectorStore.selectedIndex,
                    children: tabViews
                        .map((view) => SingleChildScrollView(
                              controller: scrollController,
                              child: view,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
