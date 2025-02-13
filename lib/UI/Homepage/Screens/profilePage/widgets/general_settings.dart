import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/profilePage/widgets/src/listTile.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Text(
            "General Settings",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 16),
          // List Items
          ListTileForProfilePage(
            'Profile Settings',
            icon: Icons.person,
            callBack: () {
              // Handle Profile Settings
            },
          ),
          const Divider(thickness: 1, color: Colors.grey, height: 24),
          ListTileForProfilePage(
            'Change Password',
            icon: Icons.lock,
            callBack: () {
              // Handle Change Password
            },
          ),
          const Divider(thickness: 1, color: Colors.grey, height: 24),
          ListTileForProfilePage(
            'Notifications',
            icon: Icons.notifications,
            callBack: () {
              // Handle Notifications
            },
          ),
          const Divider(thickness: 1, color: Colors.grey, height: 24),
          ListTileForProfilePage(
            'Transaction History',
            icon: Icons.history,
            callBack: () {},
          ),
        ],
      ),
    );
  }
}
