import 'package:flutter/material.dart';
import 'package:lab_7/pages/first_page.dart';
import 'package:lab_7/pages/second_page.dart';
import 'package:lab_7/pages/third_page.dart';
import 'package:lab_7/pages/fourth_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
    const FourthPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFF5F5F5),
          elevation: 0,
          selectedItemColor: const Color(0xFF800020),
          unselectedItemColor: const Color(0xFFB0BEC5),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          items: [
            _buildNavItem(Icons.home_outlined, Icons.home, 'Home'),
            _buildNavItem(Icons.map_outlined, Icons.map, 'Map'),
            _buildNavItem(Icons.settings_outlined, Icons.info, 'Settings'),
            _buildNavItem(Icons.person_outline, Icons.person, 'Profile'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData unselectedIcon,
    IconData selectedIcon,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(unselectedIcon),
      activeIcon: Icon(selectedIcon),
      label: label,
    );
  }
}
