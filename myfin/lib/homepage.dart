import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  final Function(int) onTabChange;
  final List<Widget> screens;

  const HomePage({super.key, required this.onTabChange, required this.screens});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[_currentIndex],
      bottomNavigationBar: GNav(
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        gap: 10,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
            widget.onTabChange(_currentIndex);
          });
        },
        selectedIndex: _currentIndex,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: const Color.fromARGB(105, 85, 1, 122),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.new_label_rounded,
            text: 'New',
          ),
          GButton(
            icon: Icons.arrow_downward,
            text: 'Expenses',
          ),
          GButton(
            icon: Icons.arrow_upward,
            text: 'Incomes',
          ),
        ],
      ),
    );
  }
}