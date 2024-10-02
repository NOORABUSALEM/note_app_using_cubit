import 'package:flutter/material.dart';
import 'package:note/core/routes/app_routes.dart';
import 'package:note/core/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(context),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
