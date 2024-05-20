import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/config/app_navigation.dart';
import 'package:imperio/stores/login/login_store.dart';
import 'package:imperio/utils/toast_notifier.dart';
import 'package:imperio/views/widgets/auth_input_field/auth_input_field.dart';
import 'package:imperio/views/widgets/shared/loading_overlay.dart';
import 'auth_page.dart';

class PasswordLoginPage extends HookWidget {
  final LoginStore loginStore;

  const PasswordLoginPage({super.key, required this.loginStore});

  Future<void> _handleLogin(Function onSuccess) async {
    if (loginStore.isPasswordValid) {
      try {
        await loginStore.login();
        onSuccess();
      } catch (e) {
        ToastNotifier.error(e.toString());
      }
    } else {
      ToastNotifier.error('Por favor, insira uma senha válida.');
    }
  }

  @override
  Widget build(BuildContext context) {
    void navigateToHome() {
      Navigator.of(context).pushNamedAndRemoveUntil(
          AppNavigation.HOME, (Route<dynamic> route) => false);
    }

    final controller =
        useMemoized(() => TextEditingController(text: loginStore.password), []);

    useEffect(() {
      controller.addListener(() {
        loginStore.password = controller.text;
      });
      return () => controller.dispose();
    }, [controller]);

    return Observer(
      builder: (_) {
        return Stack(
          children: [
            AuthPage(
              title: 'Qual sua senha?',
              onContinue: () => _handleLogin(navigateToHome),
              child: AuthInputField(
                onContinue: () => _handleLogin(navigateToHome),
                hintText: 'Senha',
                controller: controller,
                isPassword: true,
                passwordIsVisible: loginStore.passwordIsVisible,
                togglePasswordVisibility: loginStore.togglePasswordVisibility,
              ),
            ),
            LoadingOverlay(isLoading: loginStore.isLoading),
          ],
        );
      },
    );
  }
}
