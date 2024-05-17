import 'package:flutter/material.dart';
import 'package:imperio/config/app_navigation.dart';
import 'package:imperio/config/service_locator.dart';
import 'package:imperio/stores/login_store.dart';
import 'package:imperio/utils/toast_notifier.dart';
import 'auth_page.dart';

class EmailLoginPage extends StatelessWidget {
  final LoginStore loginStore = getIt<LoginStore>();

  EmailLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPage(
      title: 'Qual o seu e-mail?',
      hintText: 'seuemail@exemplo.com',
      inputType: InputType.email,
      initialValue: loginStore.email,
      onChanged: (value) {
        loginStore.setEmail(value);
      },
      onContinue: () {
        if (loginStore.isEmailValid) {
          Navigator.of(context)
              .pushNamed(AppNavigation.PASSWORD, arguments: loginStore);
        } else {
          ToastNotifier.error('Por favor, insira um e-mail válido.');
        }
      },
    );
  }
}
