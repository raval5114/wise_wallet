import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/profilePage/widgets/general_settings.dart';
import 'package:wise_wallet/UI/Homepage/Screens/profilePage/widgets/profileSection.dart';
import 'package:wise_wallet/UI/Homepage/Screens/profilePage/widgets/src/appBar.dart';
import 'package:wise_wallet/main.dart';

class Dashboard_profile extends StatefulWidget {
  const Dashboard_profile({super.key});

  @override
  State<Dashboard_profile> createState() => _Dashboard_profileState();
}

class _Dashboard_profileState extends State<Dashboard_profile> {
  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();

    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(gradient: customTheme?.navyBlackGradient),
      child: SingleChildScrollView(
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
      ),
    );
  }
}
