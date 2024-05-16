import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/login_store.dart';
import 'package:imperio/utils/app_routes.dart';
import 'package:imperio/utils/service_locator.dart';
import 'package:imperio/utils/toast_notifier.dart';
import 'package:imperio/views/widgets/shared/loading_overlay.dart';
import 'auth_page.dart';

class PasswordLoginPage extends StatefulWidget {
  const PasswordLoginPage({super.key});

  @override
  State<PasswordLoginPage> createState() => _PasswordLoginPageState();
}

class _PasswordLoginPageState extends State<PasswordLoginPage> {
  final LoginStore loginStore = getIt<LoginStore>();

  Future<void> _handleLogin() async {
    if (loginStore.isPasswordValid) {
      try {
        await loginStore.login();
        if (mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.HOME, (Route<dynamic> route) => false);
        }
      } catch (e) {
        ToastNotifier.error(e.toString());
      }
    } else {
      ToastNotifier.error('Por favor, insira uma senha válida.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Stack(
          children: [
            AuthPage(
              title: 'Qual sua senha?',
              hintText: 'Senha',
              isPassword: true,
              onChanged: (value) => loginStore.setPassword(value),
              onContinue: _handleLogin,
            ),
            LoadingOverlay(isLoading: loginStore.isLoading),
          ],
        );
      },
    );
  }
}
