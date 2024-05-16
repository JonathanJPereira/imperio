import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              LoginHeader(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 298,
                      child: Column(
                        children: [
                          LoginButton(
                            imagePath: 'assets/images/google.png',
                            text: 'Entrar com Google',
                            color: Color(0xFFE6E6E6),
                          ),
                          SizedBox(height: 16),
                          LoginButton(
                            imagePath: 'assets/images/apple.png',
                            text: 'Entrar com Apple',
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    DividerText(text: 'ou entre com'),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 298,
                      child: LoginOptions(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/happy_man.png'),
        Positioned(
          bottom: 25.0,
          left: 16.0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Entre\nem sua conta',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.12,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Acompanhe seus jogos,\ncampeonatos e times favoritos',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  final String? imagePath;
  final String text;
  final Color color;
  final Color? borderColor;

  const LoginButton({
    super.key,
    this.imagePath,
    required this.text,
    required this.color,
    this.borderColor,
  });

  bool _isDarkColor(Color color) {
    return color.computeLuminance() < 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(color),
          side: MaterialStateProperty.all(
              BorderSide(color: borderColor ?? Colors.transparent)),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        onPressed: () {
          // Implementar a lógica de login
        },
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
                    color: _isDarkColor(color) ? Colors.white : Colors.black,
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

class DividerText extends StatelessWidget {
  final String text;

  const DividerText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: LoginButton(
            text: 'Email',
            color: Colors.white,
            borderColor: Colors.black54,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: LoginButton(
            text: 'Telefone',
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
