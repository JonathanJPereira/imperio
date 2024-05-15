import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/tab_selector_store.dart';

class TabSelector extends StatelessWidget {
  final List<String> tabs;
  final Color activeColor;
  final Color inactiveColor;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final TabSelectorStore store;

  const TabSelector({
    super.key,
    required this.tabs,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.transparent,
    this.borderRadius = 100,
    this.borderColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.margin = const EdgeInsets.all(4),
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle activeTextStyle = TextStyles.textStyle(color: Colors.white);
    TextStyle inactiveTextStyle = TextStyles.textStyle(color: Colors.black);
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          return Observer(builder: (_) {
            bool isSelected = store.selectedIndex == index;
            return GestureDetector(
              onTap: () => store.setSelectedIndex(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: padding,
                margin: margin,
                decoration: BoxDecoration(
                  color: isSelected ? activeColor : inactiveColor,
                  border: !isSelected
                      ? Border.all(
                          color: borderColor ?? Theme.of(context).dividerColor,
                          width: 2)
                      : null,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Center(
                  child: Text(
                    tabs[index],
                    style: isSelected ? activeTextStyle : inactiveTextStyle,
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

class TextStyles {
  static TextStyle textStyle({required Color color}) {
    return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w700);
  }
}
