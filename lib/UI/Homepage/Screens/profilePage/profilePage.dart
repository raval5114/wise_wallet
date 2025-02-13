import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/profilePage/widgets/dashboard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Dashboard_profile();
  }
}
