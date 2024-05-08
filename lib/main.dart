import 'package:flutter/material.dart';
import 'package:imperio/utils/app_routes.dart';
import 'package:imperio/utils/service_locator.dart';
import 'package:imperio/views/pages/main_tab_page.dart';
import 'package:imperio/views/pages/main_upper_tab_page.dart';
import 'themes/app_theme.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (context) => MainTabPage(),
      },
    );
  }
}
