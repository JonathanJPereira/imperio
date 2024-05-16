import 'package:flutter/material.dart';
import 'package:imperio/utils/app_routes.dart';
import 'package:imperio/utils/service_locator.dart';
import 'package:imperio/views/pages/login/email_login_page.dart';
import 'package:imperio/views/pages/login/login_page.dart';
import 'package:imperio/views/pages/login/password_login_page.dart';
import 'package:imperio/views/pages/login/tell_login_page.dart';
import 'package:imperio/views/pages/main_tab_page.dart';
import 'package:imperio/views/pages/match_details_page.dart';
import 'package:imperio/views/pages/sports_page.dart';
import 'themes/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:imperio/stores/login_store.dart';
import 'package:get_it/get_it.dart';

void main() async {
  setupLocator();
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());

  // Certifique-se de que o método main seja assíncrono
  WidgetsFlutterBinding.ensureInitialized();

  // Obtém a instância do LoginStore
  final loginStore = GetIt.instance<LoginStore>();

  // Verifica se há um token armazenado
  final bool hasToken = await loginStore.checkToken();

  runApp(MyApp(hasToken: hasToken));
}

class MyApp extends StatelessWidget {
  final bool hasToken;

  const MyApp({super.key, required this.hasToken});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      initialRoute: hasToken ? AppRoutes.HOME : AppRoutes.LOGIN,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.PASSWORD) {
          final LoginStore loginStore = settings.arguments as LoginStore;
          return MaterialPageRoute(
            builder: (context) {
              return PasswordLoginPage(loginStore: loginStore);
            },
          );
        }
        return null;
      },
      routes: {
        AppRoutes.HOME: (context) => MainTabPage(),
        AppRoutes.SPORTS: (context) => SportsPage(),
        AppRoutes.MATCH_DETAILS: (context) => MatchDetailsPage(),
        AppRoutes.LOGIN: (context) => const LoginPage(),
        AppRoutes.EMAIL: (context) => EmailLoginPage(),
        AppRoutes.TELL: (context) => TellLoginPage(),
      },
    );
  }
}
