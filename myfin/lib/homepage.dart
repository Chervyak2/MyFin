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
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPageView(),
        ],
      ),
      bottomNavigationBar: GNav(
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        gap: 2,
        selectedIndex: _currentIndex,
        onTabChange: (index) {
          _pageController.jumpToPage(index);
        },
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: const Color.fromARGB(105, 85, 1, 122),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: '',
          ),
          GButton(
            icon: Icons.new_label_rounded,
            text: '',
          ),
          GButton(
            icon: Icons.arrow_downward,
            text: '',
          ),
          GButton(
            icon: Icons.arrow_upward,
            text: '',
          ),
            GButton(
            icon: Icons.account_circle,
            text: '',
          ),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
          widget.onTabChange(_currentIndex);
        });
      },
      pageSnapping: true,
      physics: const ClampingScrollPhysics(),
      children: widget.screens,
    );
  }
}
