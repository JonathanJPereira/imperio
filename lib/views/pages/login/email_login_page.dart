import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:imperio/config/app_navigation.dart';
import 'package:imperio/config/service_locator.dart';
import 'package:imperio/stores/login/login_store.dart';
import 'package:imperio/utils/toast_notifier.dart';
import 'package:imperio/views/widgets/auth_input_field/auth_input_field.dart';
import 'auth_page.dart';

class EmailLoginPage extends HookWidget {
  final LoginStore loginStore = getIt<LoginStore>();

  EmailLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        useMemoized(() => TextEditingController(text: loginStore.email), []);

    useEffect(() {
      controller.addListener(() {
        loginStore.email = controller.text;
      });
      return () => controller.dispose();
    }, [controller]);

    void handleContinue() {
      if (loginStore.isEmailValid) {
        Navigator.of(context)
            .pushNamed(AppNavigation.PASSWORD, arguments: loginStore);
      } else {
        ToastNotifier.error('Por favor, insira um e-mail válido.');
      }
    }

    return AuthPage(
      title: 'Qual o seu e-mail?',
      onContinue: handleContinue,
      child: AuthInputField(
        hintText: 'seuemail@exemplo.com',
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        onContinue: handleContinue,
      ),
    );
  }
}
