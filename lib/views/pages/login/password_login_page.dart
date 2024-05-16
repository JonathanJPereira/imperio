import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/login_store.dart';
import 'package:imperio/utils/app_routes.dart';
import 'package:imperio/utils/toast_notifier.dart';
import 'package:imperio/views/widgets/shared/loading_overlay.dart';
import 'auth_page.dart';

class PasswordLoginPage extends StatelessWidget {
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
          AppRoutes.HOME, (Route<dynamic> route) => false);
    }

    return Observer(
      builder: (_) {
        return Stack(
          children: [
            AuthPage(
              title: 'Qual sua senha?',
              hintText: 'Senha',
              inputType: InputType.password,
              onChanged: (value) => loginStore.setPassword(value),
              onContinue: () => _handleLogin(navigateToHome),
            ),
            LoadingOverlay(isLoading: loginStore.isLoading),
          ],
        );
      },
    );
  }
}
