import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Auth/SignIn/widgets/dashboard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Dashboard();
  }
}
