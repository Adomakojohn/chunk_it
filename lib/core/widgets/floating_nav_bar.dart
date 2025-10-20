import 'package:chunkit/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FloatingNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  const FloatingNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: AppTheme.dark.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBarItem(
              icon: 'assets/icons/house.png',
              isSelected: selectedIndex == 0,
              onTap: () => onTabChange(0),
            ),
            _NavBarItem(
              icon: 'assets/icons/plus.png',
              isSelected: selectedIndex == 1,
              onTap: () => onTabChange(1),
            ),
            _NavBarItem(
              icon: 'assets/icons/user.png',
              isSelected: selectedIndex == 2,
              onTap: () => onTabChange(2),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: ImageIcon(
            AssetImage(icon),
            size: isSelected ? 22 : 20,
            color:
                isSelected
                    ? Colors.white
                    : AppTheme.dark.colorScheme.onSurfaceVariant.withOpacity(
                      0.5,
                    ),
          ),
        ),
      ),
    );
  }
}
