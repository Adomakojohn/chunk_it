import 'package:chunkit/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Create',
          style: TextStyle(color: AppTheme.dark.colorScheme.onSurface),
        ),
      ),
    );
  }
}
