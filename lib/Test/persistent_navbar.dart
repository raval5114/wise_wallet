// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainScreen(),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

//   List<Widget> _buildScreens() {
//     return [
//       Center(child: Text("Home Screen")),
//       Center(child: Text("Search Screen")),
//       Center(child: Text("Add Screen")),
//       Center(child: Text("Messages Screen")),
//       Center(child: Text("Settings Screen")),
//     ];
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.home),
//         title: "Home",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.search),
//         title: "Search",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.add, color: Colors.white),
//         title: "Add",
//         activeColorPrimary: Colors.transparent,
//         inactiveColorPrimary: Colors.transparent,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.message),
//         title: "Messages",
//         activeColorPrimary: Colors.orange,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.settings),
//         title: "Settings",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PersistentTabView(
//         context,
//         controller: _controller,
//         screens: _buildScreens(),
//         items: _navBarsItems(),
//         confineInSafeArea: true,
//         backgroundColor: Colors.white,
//         handleAndroidBackButtonPress: true,
//         resizeToAvoidBottomInset: true,
//         stateManagement: true,
//         navBarHeight: 60,
//         navBarStyle: NavBarStyle.style15,
//         customNavBarWidget: (navBarEssentials) => CustomNavBarWidget(
//           controller: _controller,
//           navBarEssentials: navBarEssentials,
//         ),
//       ),
//     );
//   }
// }

// class CustomNavBarWidget extends StatelessWidget {
//   final PersistentTabController controller;
//   final NavBarEssentials? navBarEssentials;

//   const CustomNavBarWidget({Key? key, required this.controller, this.navBarEssentials}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//             boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
//           ),
//           padding: EdgeInsets.only(bottom: 10, top: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               IconButton(icon: Icon(Icons.home, size: 28), onPressed: () => controller.jumpToTab(0)),
//               IconButton(icon: Icon(Icons.search, size: 28), onPressed: () => controller.jumpToTab(1)),
//               SizedBox(width: 50),
//               IconButton(icon: Icon(Icons.message, size: 28), onPressed: () => controller.jumpToTab(3)),
//               IconButton(icon: Icon(Icons.settings, size: 28), onPressed: () => controller.jumpToTab(4)),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 20,
//           child: FloatingActionButton(
//             backgroundColor: Colors.blue,
//             elevation: 5,
//             shape: CircleBorder(),
//             onPressed: () => controller.jumpToTab(2),
//             child: Icon(Icons.add, size: 32, color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }
