import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Screens/Pages/emailMobileNumberPage.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Screens/src/loginPageNavigate.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  String? _errorTextFirstName;
  String? _errorTextLastName;
  String? _errorTextUsername;
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _validateFields() {
    setState(() {
      // First Name Validation
      if (_firstNameController.text.isEmpty) {
        _errorTextFirstName = "First name is required.";
      } else {
        _errorTextFirstName = null;
      }

      // Last Name Validation
      if (_lastNameController.text.isEmpty) {
        _errorTextLastName = "Last name is required.";
      } else {
        _errorTextLastName = null;
      }

      // Username Validation
      if (_usernameController.text.isEmpty) {
        _errorTextUsername = "Username is required.";
      } else if (_usernameController.text.length < 3) {
        _errorTextUsername = "Username must be at least 3 characters.";
      } else {
        _errorTextUsername = null;
      }

      // Enable Button if all validations pass
      _isButtonEnabled = _errorTextFirstName == null &&
          _errorTextLastName == null &&
          _errorTextUsername == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Full Name Fields
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    hintText: "First Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                    errorText: _errorTextFirstName,
                  ),
                  onChanged: (value) => _validateFields(),
                ),
              ),
              SizedBox(width: 10), // Space between the fields
              Expanded(
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    hintText: "Last Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                    errorText: _errorTextLastName,
                  ),
                  onChanged: (value) => _validateFields(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Username Field
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: "Username",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
              errorText: _errorTextUsername,
            ),
            onChanged: (value) => _validateFields(),
          ),
          SizedBox(height: 20),
          // Next Button
          ElevatedButton(
            onPressed: _isButtonEnabled
                ? () {
                    regUser.newFirstname = _firstNameController.text.toString();
                    regUser.newLastname = _lastNameController.text.toString();
                    debugPrint("${regUser.firstName}\n${regUser.lastName}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailMobileNumber(),
                      ),
                    );
                  }
                : null, // Disable button if validation fails
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: _isButtonEnabled
                  ? Colors.blueAccent
                  : Colors.grey, // Dynamic color
            ),
            child: Text(
              "Next",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          // Navigate to Login Page
          NavigateToLoginPage(),
        ],
      ),
    );
  }
}
