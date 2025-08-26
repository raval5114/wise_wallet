import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Homepage/Screens/offlineAccount/signup/sign_up_passwword_setting_page.dart';

class SignupPageComponent extends StatefulWidget {
  const SignupPageComponent({super.key});

  @override
  State<SignupPageComponent> createState() => _SignupPageComponentState();
}

class _SignupPageComponentState extends State<SignupPageComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Heading
              Text(
                "Wallet Information !",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              Icon(Icons.check_circle, color: Colors.greenAccent, size: 80),
              const SizedBox(height: 30),

              Text(
                "Here are your wallet credentials:",
                style: const TextStyle(color: Colors.white70, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // User Details Card
              _infoTile("First Name", userSession.firstName ?? "N/A"),
              const SizedBox(height: 12),
              _infoTile("Last Name", userSession.lastName ?? "N/A"),
              const SizedBox(height: 12),
              _infoTile("Email", userSession.email ?? "N/A"),
              const SizedBox(height: 12),

              _infoTile("Mobile Number",
                  userSession.userBankAccountDetails!.mobileNumber ?? "N/A"),

              const SizedBox(height: 30),

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPasswwordSettingPage(
                          firstName: userSession.firstName!,
                          lastName: userSession.lastName!,
                          email: userSession.email!,
                          mobileNumber: userSession.mobile!,
                        ),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable UI for displaying info
  Widget _infoTile(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 14)),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
