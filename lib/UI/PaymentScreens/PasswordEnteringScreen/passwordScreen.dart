import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/PaymentScreens/PasswordEnteringScreen/widgets/pinCheckingComponent.dart';
import 'package:wise_wallet/main.dart';

class PasswordScreen extends StatelessWidget {
  final VoidCallback callBack;

  const PasswordScreen({super.key, required this.callBack});
  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enter PIN",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A00E0), Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: PasswordCheckingComponent(
        onPinEntered: callBack,
      ),
    );
  }
}
