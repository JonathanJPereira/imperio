import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:imperio/config/app_navigation.dart';
import 'package:imperio/config/service_locator.dart';
import 'package:imperio/stores/login/login_store.dart';
import 'package:imperio/utils/toast_notifier.dart';
import 'package:imperio/views/widgets/auth_input_field/auth_input_field.dart';
import 'auth_page.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class PhoneLoginPage extends HookWidget {
  final LoginStore loginStore = getIt<LoginStore>();

  PhoneLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(
        () => MaskedTextController(
            mask: '(00) 00000-0000', text: loginStore.phone),
        []);

    useEffect(() {
      controller.addListener(() {
        loginStore.phone = controller.text;
      });
      return () => controller.dispose();
    }, [controller]);

    void handleContinue() async {
      if (loginStore.isPhoneValid) {
        await Navigator.of(context).pushNamed(
          AppNavigation.PASSWORD,
          arguments: loginStore,
        );
      } else {
        ToastNotifier.error('Por favor, insira um telefone válido.');
      }
    }

    return AuthPage(
      title: 'Qual o seu telefone?',
      onContinue: handleContinue,
      child: AuthInputField(
        hintText: '(00) 00000-0000',
        controller: controller,
        keyboardType: TextInputType.phone,
        onContinue: handleContinue,
      ),
    );
  }
}
