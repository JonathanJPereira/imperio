import 'package:flutter/material.dart';
import 'package:imperio/utils/app_routes.dart';
import 'package:imperio/utils/service_locator.dart';
import 'package:imperio/stores/login_store.dart';
import 'package:imperio/utils/toast_notifier.dart';
import 'auth_page.dart';

class TellLoginPage extends StatelessWidget {
  final LoginStore loginStore = getIt<LoginStore>();

  TellLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPage(
      title: 'Qual o seu telefone?',
      hintText: '(00) 00000-0000',
      isPassword: false,
      onChanged: (value) {
        loginStore.setTell(value);
      },
      onContinue: () {
        if (loginStore.isTellValid) {
          Navigator.of(context)
              .pushNamed(AppRoutes.PASSWORD, arguments: loginStore);
        } else {
          ToastNotifier.error('Por favor, insira um telefone válido.');
        }
      },
      mask: '(00) 00000-0000',
    );
  }
}
