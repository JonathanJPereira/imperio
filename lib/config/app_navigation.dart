import 'package:flutter/material.dart';
import 'package:imperio/views/pages/login/email_login_page.dart';
import 'package:imperio/views/pages/login/login_page.dart';
import 'package:imperio/views/pages/login/password_login_page.dart';
import 'package:imperio/views/pages/login/tell_login_page.dart';
import 'package:imperio/views/pages/main_tab_page.dart';
import 'package:imperio/views/pages/match_details_page.dart';
import 'package:imperio/views/pages/sports_page.dart';
import 'package:imperio/stores/login_store.dart';

class AppNavigation {
  static const HOME = '/';
  static const SPORTS = '/sports';
  static const MATCH_DETAILS = '/match_details';
  static const LOGIN = '/login';
  static const EMAIL = '/email';
  static const PASSWORD = '/password';
  static const TELL = '/tell';
}

Map<String, WidgetBuilder> appRoutes = {
  AppNavigation.HOME: (context) => MainTabPage(),
  AppNavigation.SPORTS: (context) => SportsPage(),
  AppNavigation.MATCH_DETAILS: (context) => MatchDetailsPage(),
  AppNavigation.LOGIN: (context) => const LoginPage(),
  AppNavigation.EMAIL: (context) => EmailLoginPage(),
  AppNavigation.TELL: (context) => TellLoginPage(),
};

Route<dynamic>? generateRoute(RouteSettings settings) {
  if (settings.name == AppNavigation.PASSWORD) {
    final LoginStore loginStore = settings.arguments as LoginStore;
    return MaterialPageRoute(
      builder: (context) {
        return PasswordLoginPage(loginStore: loginStore);
      },
    );
  }
  return null;
}
