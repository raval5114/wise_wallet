import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/ScannerSection/scanner.dart';
import 'package:wise_wallet/UI/Homepage/Screens/cardPage/cardPage.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/homePage.dart';
import 'package:wise_wallet/UI/Homepage/Screens/profilePage/profilePage.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/statePage.dart';

class CustomHomePage extends StatefulWidget {
  const CustomHomePage({super.key});

  @override
  _CustomHomePageState createState() => _CustomHomePageState();
}

class _CustomHomePageState extends State<CustomHomePage> {
  final List<Widget> _pages = [
    homePage(),
    CardPage(),
    ScannerSection(), // Placeholder for the center button
    StatePage(),
    ProfilePage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
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
            icon: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFF4A00E0),
              child: const Icon(
                Icons.center_focus_strong,
                color: Colors.white,
                size: 28,
              ),
            ),
            // Placeholder for center button
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: "State",
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
      //   floatingActionButton: FloatingActionButton(
      //     shape: const CircleBorder(),
      //     onPressed: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => ScannerSection(),
      //           ));
      //     },
      //     backgroundColor: const Color(0xFF4A00E0),
      //     child: const Icon(
      //       Icons.center_focus_strong,
      //       color: Colors.white,
      //       size: 28,
      //     ),
      //   ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // );
    );
  }
}
