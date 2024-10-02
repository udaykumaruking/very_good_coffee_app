// lib/screens/image_loader_screen.dart
import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/components/bottom_nav_bar.dart';
import 'package:very_good_coffee_app/constants/app_constants.dart';
import '../screens/favorites_page.dart';
import '../screens/home_page.dart';

class ImageLoaderScreen extends StatefulWidget {
  const ImageLoaderScreen({super.key});

  @override
  State<ImageLoaderScreen> createState() => _ImageLoaderScreenState();
}

class _ImageLoaderScreenState extends State<ImageLoaderScreen> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: MyBottomNavBar(
          onTabChange: navigateBottomBar,
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
