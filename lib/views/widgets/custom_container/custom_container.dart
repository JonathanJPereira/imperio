import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final bool border;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const CustomContainer({
    super.key,
    required this.child,
    this.border = false,
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.all(15),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        border: border ? Border.all(color: const Color(0xFFDEE0DF)) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}
