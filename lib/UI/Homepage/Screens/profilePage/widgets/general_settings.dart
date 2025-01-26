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
    return // General Settings Section
        Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          listTileForProfilePage('Profile Settings', callBack: () {}),
          Divider(),
          listTileForProfilePage('Change Password', callBack: () {}),
          Divider(),
          listTileForProfilePage('Notifaction', callBack: () {}),
          Divider(),
          listTileForProfilePage('Transaction History', callBack: () {}),
        ],
      ),
    );
  }
}
