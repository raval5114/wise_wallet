import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Screens/Pages/AddAccountDetailsPage.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _errorText;

  void _validatePasswords() {
    setState(() {
      if (_passwordController.text.isEmpty ||
          _confirmPasswordController.text.isEmpty) {
        _errorText = "Both fields are required.";
      } else if (_passwordController.text.length < 8) {
        _errorText = "Password must be at least 8 characters long.";
      } else if (_passwordController.text != _confirmPasswordController.text) {
        _errorText = "Passwords do not match.";
      } else {
        _errorText = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create a Secure Password",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Your password should be at least 8 characters long and include a mix of letters, numbers, and symbols for better security.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          // Password Field
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
            ),
            obscureText: true,
            onChanged: (value) => _validatePasswords(),
          ),
          SizedBox(height: 20),
          // Confirm Password Field
          TextField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              hintText: "Confirm Password",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.lock_outline, color: Colors.blueAccent),
            ),
            obscureText: true,
            onChanged: (value) => _validatePasswords(),
          ),
          SizedBox(height: 20),
          // Error Message
          if (_errorText != null)
            Text(
              _errorText!,
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
          SizedBox(height: 20),
          // Sign Up Button
          ElevatedButton(
            onPressed: () => {
              regUser.newPassword = _confirmPasswordController.text.toString(),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddAccountDetailsPage()))
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor:
                  _errorText == null ? Colors.blueAccent : Colors.grey,
            ),
            child: Text(
              "Next",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
