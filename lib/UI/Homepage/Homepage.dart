import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/cardPage/cardPage.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/homePage.dart';
import 'package:wise_wallet/UI/Homepage/Screens/profilePage/profilePage.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/statePage.dart';

class CustomHomePage extends StatefulWidget {
  @override
  _CustomHomePageState createState() => _CustomHomePageState();
}

class _CustomHomePageState extends State<CustomHomePage> {
  final List<Widget> _pages = [
    homePage(),
    CardPage(),
    Container(), // Placeholder for the center button
    StatePage(),
    ProfilePage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) return; // Do nothing for the central button
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex > 2 ? _selectedIndex - 1 : _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Card",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(width: 48),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: "Stat",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        selectedItemColor: const Color(0xFF4A00E0),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          debugPrint("Central button pressed");
        },
        backgroundColor: const Color(0xFF4A00E0),
        child: const Icon(
          Icons.center_focus_strong,
          color: Colors.white,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
