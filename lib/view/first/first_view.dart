import 'package:educational_for_children/view/favorite/favorite_view.dart';
import 'package:educational_for_children/view/home/home_view.dart';
import 'package:educational_for_children/view/setting/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstView extends StatefulWidget {
  final bool? isDarkMode;
  final Function(bool)? onThemeChanged;

  const FirstView({super.key, this.isDarkMode, this.onThemeChanged});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    HomePage(),
    FavoritePage(),
    SettingView(isDarkMode: true, onThemeChanged: (bool) {}),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
