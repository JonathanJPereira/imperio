import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:imperio/views/widgets/custom_large_button/custom_large_button.dart';

class AuthPage extends HookWidget {
  final String title;
  final void Function()? onContinue;
  final Widget child;

  const AuthPage({
    super.key,
    required this.title,
    required this.child,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          style: const ButtonStyle(elevation: MaterialStatePropertyAll(0)),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthTitle(title: title),
            const SizedBox(height: 32),
            child,
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: CustomLargeButton(
                text: 'Continuar',
                onTap: onContinue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthTitle extends StatelessWidget {
  final String title;

  const AuthTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
