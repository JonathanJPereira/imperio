import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/custom_back_button.dart';

class PlaceholderPage extends StatelessWidget {
  final String message;

  const PlaceholderPage(
      {super.key, this.message = "Conteúdo em desenvolvimento..."});

  @override
  Widget build(BuildContext context) {
    bool canPop = Navigator.canPop(context);
    return Scaffold(
      appBar: AppBar(
        leading: canPop ? const CustomBackButton() : null,
        centerTitle: false,
        title: Text(message),
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
