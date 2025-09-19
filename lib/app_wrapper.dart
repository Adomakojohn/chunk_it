import 'package:chunkit/core/theme/app_theme.dart';
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
      backgroundColor: AppTheme.dark.colorScheme.surface,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppTheme.dark.colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          backgroundColor: AppTheme.dark.colorScheme.surface,
          selectedItemColor: AppTheme.dark.colorScheme.primary,
          unselectedItemColor: AppTheme.dark.colorScheme.onSurfaceVariant,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/house.png')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/plus.png')),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/user.png')),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
