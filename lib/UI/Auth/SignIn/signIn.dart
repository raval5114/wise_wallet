import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Auth/SignIn/widgets/dashboard.dart';
import 'package:wise_wallet/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(gradient: customTheme!.navyBlackGradient),
          ),
          // Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Dashboard(),
            ),
          ),
        ],
      ),
    );
  }
}
