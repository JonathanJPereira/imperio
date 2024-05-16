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
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => getIt<LoginStore>(),
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        initialRoute: '/',
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
          '/': (context) => const SplashScreen(),
          AppRoutes.HOME: (context) => MainTabPage(),
          AppRoutes.SPORTS: (context) => SportsPage(),
          AppRoutes.MATCH_DETAILS: (context) => MatchDetailsPage(),
          AppRoutes.LOGIN: (context) => const LoginPage(),
          AppRoutes.EMAIL: (context) => EmailLoginPage(),
          AppRoutes.TELL: (context) => TellLoginPage(),
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    final loginStore = Provider.of<LoginStore>(context, listen: false);
    final hasToken = await loginStore.checkToken();

    if (hasToken) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
