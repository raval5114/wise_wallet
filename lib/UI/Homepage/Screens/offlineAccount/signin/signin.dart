import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/offlineAccount/signup/signup_wallet_page.dart';

class SigninWalletPage extends StatefulWidget {
  const SigninWalletPage({super.key});

  @override
  State<SigninWalletPage> createState() => _SigninWalletPageState();
}

class _SigninWalletPageState extends State<SigninWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WalletSsignUp());
  }
}
