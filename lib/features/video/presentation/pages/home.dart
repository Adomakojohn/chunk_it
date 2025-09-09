import 'package:chunkit/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            color: AppTheme.dark.colorScheme.onSurface,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}
