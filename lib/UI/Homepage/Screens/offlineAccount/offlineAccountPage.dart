import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Auth/SignUp/repos/signup.dart';
import 'package:wise_wallet/UI/Homepage/Screens/offlineAccount/signin/signin.dart';
import 'package:wise_wallet/UI/Homepage/Screens/offlineAccount/signup/signup_wallet_page.dart';
import 'package:wise_wallet/main.dart';

class OfflineAccountPage extends StatelessWidget {
  const OfflineAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: customTheme!.navyBlackGradient,
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Icon or Illustration
                  Icon(Icons.account_balance_wallet_rounded,
                      size: 80, color: Colors.white),
                  const SizedBox(height: 24),

                  // Headline
                  Text(
                    "Welcome to WiseWallety",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  // Subtext
                  Text(
                    "Your offline payment service.\n"
                    "If you already have an account, please sign in.\n"
                    "New here? Sign up and get started!",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white70,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Buttons
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SigninWalletPage(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            // TODO: Navigate to Sign Up
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WalletSsignUp()));
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: const BorderSide(color: Colors.white70),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
