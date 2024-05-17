import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthInputField extends HookWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onContinue;
  final bool passwordIsVisible;
  final VoidCallback? togglePasswordVisibility;
  final bool isPassword;
  final TextInputType keyboardType;

  const AuthInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onContinue,
    this.passwordIsVisible = false,
    this.togglePasswordVisibility,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
      borderRadius: BorderRadius.circular(12.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (focusNode.canRequestFocus) {
          focusNode.requestFocus();
        }
      });
      return;
    }, [focusNode]);

    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: isPassword && !passwordIsVisible,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: _buildBorder(Colors.grey),
        focusedBorder: _buildBorder(Theme.of(context).colorScheme.secondary),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  passwordIsVisible ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: togglePasswordVisibility,
              )
            : null,
      ),
      onSubmitted: (value) {
        if (onContinue != null) {
          onContinue!();
        }
      },
    );
  }
}
