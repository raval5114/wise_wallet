import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/offlineAccount/signup/widgets/sign_up_page_component.dart';
import 'package:wise_wallet/main.dart';

class WalletSsignUp extends StatefulWidget {
  const WalletSsignUp({super.key});

  @override
  State<WalletSsignUp> createState() => _WalletSsignUpState();
}

class _WalletSsignUpState extends State<WalletSsignUp> {
  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: customTheme!.navyBlackGradient),
          child: SignupPageComponent()),
    );
  }
}
