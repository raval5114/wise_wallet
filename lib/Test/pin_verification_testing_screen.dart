import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/PaymentScreens/PasswordEnteringScreen/widgets/pinCheckingComponent.dart';

class CheckPasswordScreenTesting extends StatelessWidget {
  const CheckPasswordScreenTesting({super.key});

  @override
  Widget build(BuildContext context) {
    void runOnPinEntered() {
      debugPrint("Yas its workin");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pin Verification Testing",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: PasswordCheckingComponent(
        onPinEntered: runOnPinEntered,
        navigationType: () {},
      ),
    );
  }
}
