import 'package:flutter/material.dart';
import 'package:note/core/theme/app_theme.dart';

import 'features/home/presntation/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getTheme(context),
      home: const HomeScreen(),

    );
  }
}
