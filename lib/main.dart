import 'package:chunkit/app_wrapper.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chunkit',
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: const AppWrapper(),
    );
  }
}
