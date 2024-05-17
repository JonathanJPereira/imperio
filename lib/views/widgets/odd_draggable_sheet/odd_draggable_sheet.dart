import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/matches_store.dart';
import 'package:imperio/stores/odds_matches_store.dart';
import 'package:imperio/stores/tab_selector_store.dart';
import 'package:imperio/views/widgets/odd_draggable_sheet/highest_odds.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';
import 'package:imperio/views/widgets/tab_selector/tab_selector.dart';

class OddDraggableSheet extends HookWidget {
  final TabSelectorStore tabSelectorStore = GetIt.I<TabSelectorStore>();
  final MatchesStore matchesStore = GetIt.I<MatchesStore>();

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    final colorAnimation = useMemoized(() {
      return ColorTween(
        begin: Theme.of(context).colorScheme.secondary,
        end: Color(0xFFDEE0DF),
      ).animate(animationController);
    }, [animationController]);

    List<Widget> tabViews = [
      HighestOdds(),
      const Text('Amanhã'),
    ];

    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        animationController.value = notification.extent;
        return true;
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.2,
        minChildSize: 0.1,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return AnimatedBuilder(
            animation: colorAnimation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  color: colorAnimation.value,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(40)),
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
        },
      ),
    );
  }
}
