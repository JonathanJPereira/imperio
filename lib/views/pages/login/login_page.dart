import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:imperio/config/app_navigation.dart';
import 'package:imperio/views/widgets/custom_large_button/custom_large_button.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Definir a orientação da tela para retrato apenas
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              LoginHeader(),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 298,
                    child: Column(
                      children: [
                        CustomLargeButton(
                          imagePath: 'assets/images/google.png',
                          text: 'Entrar com Google',
                          color: Color(0xFFE6E6E6),
                        ),
                        SizedBox(height: 16),
                        CustomLargeButton(
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
            ],
          ),
        ),
      ),
    );
  }
}

class LoginHeader extends HookWidget {
  const LoginHeader({super.key});

  Future<void> _precacheImage(BuildContext context) async {
    await precacheImage(
        const AssetImage('assets/images/happy_man.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    // Use useEffect para configurar a barra de status quando o widget é montado
    useEffect(() {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ));
      return null;
    }, []);

    return FutureBuilder(
      future: _precacheImage(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomLargeButton(
            text: 'Email',
            color: Colors.white,
            borderColor: Colors.black54,
            onTap: () {
              Navigator.of(context).pushNamed(AppNavigation.EMAIL);
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomLargeButton(
            text: 'Telefone',
            onTap: () {
              Navigator.of(context).pushNamed(AppNavigation.TELL);
            },
          ),
        ),
      ],
    );
  }
}
