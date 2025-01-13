import 'package:flutter/material.dart';

class TitleandSubtitle extends StatelessWidget {
  const TitleandSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Get Started Text
        Text(
          "Get Started!",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Create your account to start managing your expenses",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
