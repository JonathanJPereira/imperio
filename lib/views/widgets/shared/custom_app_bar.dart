import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;

  const CustomAppBar({
    required this.title,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool canPop = Navigator.canPop(context);
    return AppBar(
      leading: canPop ? const CustomBackButton() : null,
      centerTitle: false,
      title: Text(title),
      backgroundColor: backgroundColor ?? backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        iconSize: 18,
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.6),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary),
        ),
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
