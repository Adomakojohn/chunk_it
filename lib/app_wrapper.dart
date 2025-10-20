import 'package:chunkit/core/widgets/floating_nav_bar.dart';
import 'package:chunkit/features/video/presentation/pages/create_page.dart';
import 'package:chunkit/features/video/presentation/pages/home.dart';
import 'package:chunkit/features/video/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  int _selectedIndex = 0;

  // Your pages
  final List<Widget> _pages = [
    const Home(),
    const CreatePage(),
    const ProfilePage(),
    // const SearchPage(),
    // const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: FloatingNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
