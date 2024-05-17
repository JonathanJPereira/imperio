import 'package:flutter/material.dart';

class CustomLargeButton extends StatelessWidget {
  final String? imagePath;
  final String text;
  final Color? color;
  final Color? borderColor;
  final void Function()? onTap;

  const CustomLargeButton({
    super.key,
    this.imagePath,
    required this.text,
    this.color,
    this.borderColor,
    this.onTap,
  });

  bool _isDarkColor(Color color) {
    return color.computeLuminance() < 0.5;
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? Theme.of(context).colorScheme.secondary;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor ?? Colors.transparent),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        onPressed: onTap,
        child: SizedBox(
          height: 56,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (imagePath != null)
                Positioned(
                  left: 15,
                  child: Image.asset(
                    imagePath!,
                    width: 24,
                    height: 24,
                  ),
                ),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color:
                        _isDarkColor(buttonColor) ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
