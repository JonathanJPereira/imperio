import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/custom_large_button/custom_large_button.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

enum InputType { text, email, phone, password }

class AuthPage extends StatelessWidget {
  final String title;
  final String hintText;
  final InputType inputType;
  final void Function(String value)? onChanged;
  final void Function()? onContinue;
  final String? mask;

  const AuthPage({
    super.key,
    required this.title,
    required this.hintText,
    this.inputType = InputType.text,
    this.onChanged,
    this.onContinue,
    this.mask,
  });

  @override
  Widget build(BuildContext context) {
    final controller = mask != null
        ? MaskedTextController(mask: mask)
        : TextEditingController();
    final FocusNode focusNode = FocusNode();

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
            const SizedBox(height: 16),
            AuthInputField(
              hintText: hintText,
              inputType: inputType,
              onChanged: onChanged,
              controller: controller,
              focusNode: focusNode,
              onContinue: onContinue,
            ),
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

class AuthInputField extends StatelessWidget {
  final String hintText;
  final InputType inputType;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function()? onContinue;

  const AuthInputField({
    super.key,
    required this.hintText,
    this.inputType = InputType.text,
    this.onChanged,
    required this.controller,
    required this.focusNode,
    this.onContinue,
  });

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
      borderRadius: BorderRadius.circular(12.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextInputType getKeyboardType() {
      switch (inputType) {
        case InputType.email:
          return TextInputType.emailAddress;
        case InputType.phone:
          return TextInputType.phone;
        case InputType.password:
          return TextInputType.visiblePassword;
        case InputType.text:
        default:
          return TextInputType.text;
      }
    }

    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: getKeyboardType(),
      obscureText: inputType == InputType.password,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: _buildBorder(Colors.grey),
        focusedBorder: _buildBorder(Theme.of(context).colorScheme.secondary),
        suffixIcon: inputType == InputType.password ? const Icon(Icons.visibility) : null,
      ),
      onChanged: onChanged,
      onSubmitted: (value) {
        if (onContinue != null) {
          onContinue!();
        }
      },
    );
  }
}