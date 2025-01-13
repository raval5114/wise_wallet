import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Screens/src/emailMobileNumberAndDob.dart';
import 'package:wise_wallet/main.dart';

class EmailMobileNumber extends StatefulWidget {
  const EmailMobileNumber({super.key});

  @override
  State<EmailMobileNumber> createState() => _EmailMobileNumberState();
}

class _EmailMobileNumberState extends State<EmailMobileNumber> {
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
                child: EmailMobileNumberAndDob()),
          ),
        ],
      ),
    );
  }
}
