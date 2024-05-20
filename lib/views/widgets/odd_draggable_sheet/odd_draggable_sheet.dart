import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/matches_store.dart';
import 'package:imperio/stores/tab_selector_store.dart';
import 'package:imperio/views/widgets/odd_draggable_sheet/highest_odds.dart';
import 'package:imperio/views/widgets/odd_draggable_sheet/other_odds.dart';
import 'package:imperio/views/widgets/tab_selector/tab_selector.dart';

class OddDraggableSheet extends HookWidget {
  final TabSelectorStore tabSelectorStore = GetIt.I<TabSelectorStore>();
  final MatchesStore matchesStore = GetIt.I<MatchesStore>();

  OddDraggableSheet({super.key});

  double mapExtentToAnimationValue(double extent) {
    const double minExtent = 0.23;
    const double maxExtent = 1.0;
    return (extent - minExtent) / (maxExtent - minExtent);
  }

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final colorAnimation = useMemoized(() {
      return ColorTween(
        begin: Theme.of(context).colorScheme.secondary,
        end: const Color(0xFFDEE0DF),
      ).animate(animationController);
    }, [animationController]);

    final colorAnimationContainer = useMemoized(() {
      return ColorTween(
        begin: Colors.transparent,
        end: const Color(0xFFC0C4C2),
      ).animate(animationController);
    }, [animationController]);

    final paddingAnimation = useMemoized(() {
      return Tween<double>(
        begin: 0,
        end: 15.0,
      ).animate(animationController);
    }, [animationController]);

    List<Widget> tabViews = [
      HighestOdds(
          colorAnimation: colorAnimationContainer,
          paddingAnimation: paddingAnimation),
      OtherOdds(
        colorAnimation: colorAnimationContainer,
        teamAName: matchesStore.currentMatch!.teamA,
      ),
    ];

    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        animationController.value =
            mapExtentToAnimationValue(notification.extent);
        return false;
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.23,
        minChildSize: 0.23,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return AnimatedBuilder(
            animation: colorAnimation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: colorAnimation.value,
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
                        return Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: TabSelector(
                            store: tabSelectorStore,
                            tabs: const ['Odds mais altas', 'Outras odds'],
                            borderColor: const Color(0xFF646E69),
                          ),
                        );
                      }),
                      Observer(builder: (context) {
                        return tabViews[tabSelectorStore.selectedIndex];
                      }),
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
