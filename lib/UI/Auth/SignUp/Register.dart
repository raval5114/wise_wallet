import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Screens/Pages/firstLastUsernameDobPage.dart';
import 'package:wise_wallet/main.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(gradient: customTheme?.navyBlackGradient),
          ),
          // Main Content
          Center(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FirstLastNamePage()),
          ),
        ],
      ),
    );
  }
}
