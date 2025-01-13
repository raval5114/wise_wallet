import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Auth/SignIn/signIn.dart';

class NavigateToLoginPage extends StatefulWidget {
  const NavigateToLoginPage({super.key});

  @override
  State<NavigateToLoginPage> createState() => _NavigateToLoginPageState();
}

class _NavigateToLoginPageState extends State<NavigateToLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 70),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              )); // Navigate back to login
        },
        child: Text(
          "Already have an account? Sign In",
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
