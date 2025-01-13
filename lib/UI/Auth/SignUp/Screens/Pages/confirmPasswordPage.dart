import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Screens/src/confirmPassword.dart';
import 'package:wise_wallet/main.dart';

class Confirmpasswordpage extends StatefulWidget {
  const Confirmpasswordpage({super.key});

  @override
  State<Confirmpasswordpage> createState() => _ConfirmpasswordpageState();
}

class _ConfirmpasswordpageState extends State<Confirmpasswordpage> {
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
                padding: const EdgeInsets.all(16.0), child: ConfirmPassword()),
          ),
        ],
      ),
    );
  }
}
