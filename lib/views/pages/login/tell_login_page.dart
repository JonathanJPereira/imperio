import 'package:flutter/material.dart';
import 'package:imperio/config/app_navigation.dart';
import 'package:imperio/config/service_locator.dart';
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
      inputType: InputType.phone,
      initialValue: loginStore.tell,
      onChanged: (value) {
        loginStore.setTell(value);
      },
      onContinue: () {
        if (loginStore.isTellValid) {
          Navigator.of(context)
              .pushNamed(AppNavigation.PASSWORD, arguments: loginStore);
        } else {
          ToastNotifier.error('Por favor, insira um telefone válido.');
        }
      },
      mask: '(00) 00000-0000',
    );
  }
}
