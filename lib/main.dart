import 'package:flutter/material.dart';
import 'package:imperio/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'themes/app_theme.dart';
import 'views/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme
            .lightTheme,
        initialRoute: '/',
        routes: {
          AppRoutes.HOME: (context) => HomePage(),
        },
      ),
    );
  }
}
