import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/config/app_navigation.dart';
import 'package:imperio/config/setup_app.dart';
import 'package:imperio/stores/login/login_store.dart';
import 'package:imperio/themes/app_theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await setupApp();

  final loginStore = GetIt.instance<LoginStore>();

  final bool hasToken = await loginStore.checkToken();

 if (hasToken) {
  // A linha abaixo está comentada porque a API atual possui tokens que não expiram.
  // Descomente a linha se a lógica de renovação de token for necessária no futuro.
  // await loginStore.refreshToken();
}

  runApp(MyApp(hasToken: hasToken));
}

class MyApp extends StatelessWidget {
  final bool hasToken;

  const MyApp({super.key, required this.hasToken});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      initialRoute: hasToken ? AppNavigation.HOME : AppNavigation.LOGIN,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      routes: appRoutes,
    );
  }
}
