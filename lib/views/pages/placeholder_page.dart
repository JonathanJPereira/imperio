import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/custom_app_bar.dart';

class PlaceholderPage extends StatelessWidget {
  final String message;

  const PlaceholderPage({
    super.key,
    this.message = "Conteúdo em desenvolvimento...",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: message,
      ),
      body: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
