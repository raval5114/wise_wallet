import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/profilePage/widgets/general_settings.dart';
import 'package:wise_wallet/UI/Homepage/Screens/profilePage/widgets/profileSection.dart';
import 'package:wise_wallet/UI/Homepage/Screens/profilePage/widgets/src/appBar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // AppBar
          ProfilePageAppBar(),
          const SizedBox(height: 20),
          // Profile Section
          ProfileSection(),
          const SizedBox(height: 20),

          // General Settings Section
          GeneralSettings()
        ],
      ),
    );
  }
}
