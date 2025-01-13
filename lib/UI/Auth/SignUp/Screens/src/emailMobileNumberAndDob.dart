import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Screens/Pages/confirmPasswordPage.dart';

class EmailMobileNumberAndDob extends StatefulWidget {
  const EmailMobileNumberAndDob({super.key});

  @override
  State<EmailMobileNumberAndDob> createState() =>
      _EmailMobileNumberAndDobState();
}

class _EmailMobileNumberAndDobState extends State<EmailMobileNumberAndDob> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  String? _errorTextEmail;
  String? _errorTextMobile;
  String? _errorTextDob;
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _emailController.dispose();
    _mobileController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _validateFields() {
    setState(() {
      // Email Validation
      if (_emailController.text.isEmpty) {
        _errorTextEmail = "Email is required.";
      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
          .hasMatch(_emailController.text)) {
        _errorTextEmail = "Enter a valid email address.";
      } else {
        _errorTextEmail = null;
      }

      // Mobile Number Validation
      if (_mobileController.text.isEmpty) {
        _errorTextMobile = "Mobile number is required.";
      } else if (!RegExp(r'^\d{10}$').hasMatch(_mobileController.text)) {
        _errorTextMobile = "Enter a valid 10-digit mobile number.";
      } else {
        _errorTextMobile = null;
      }

      // DOB Validation
      if (_dobController.text.isEmpty) {
        _errorTextDob = "Date of birth is required.";
      } else {
        _errorTextDob = null;
      }

      // Enable Button if all validations pass
      _isButtonEnabled = _errorTextEmail == null &&
          _errorTextMobile == null &&
          _errorTextDob == null;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
        _errorTextDob = null; // Clear DOB error
        _validateFields(); // Revalidate after selecting a date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Description
          Text(
            "Personal Information Form",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Please enter your email, mobile number, and date of birth to proceed. "
            "Ensure all fields are filled correctly for a smooth registration process.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          // Email Field
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "Email",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
              errorText: _errorTextEmail,
            ),
            onChanged: (value) => _validateFields(),
          ),
          SizedBox(height: 20),
          // Mobile Number Field
          TextField(
            controller: _mobileController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Mobile Number",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.phone, color: Colors.blueAccent),
              errorText: _errorTextMobile,
            ),
            onChanged: (value) => _validateFields(),
          ),
          SizedBox(height: 20),
          // Date of Birth Field
          TextField(
            controller: _dobController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: "Date of Birth",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.calendar_today, color: Colors.blueAccent),
              suffixIcon: IconButton(
                icon: Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
                onPressed: () => _selectDate(context),
              ),
              errorText: _errorTextDob,
            ),
            onTap: () => _selectDate(context),
          ),
          SizedBox(height: 30),
          // Submit Button
          ElevatedButton(
            onPressed: () => {
              regUser.newEmail = _emailController.text.toString(),
              regUser.mobile = _mobileController.text.toString(),
              regUser.newDob = _dobController.text.toString(),
              debugPrint("${regUser.dob}}\n${regUser.email}"),
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Confirmpasswordpage(),
                  ))
            }, // Disable button if validation fails
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: _isButtonEnabled
                  ? Colors.blueAccent
                  : Colors.grey, // Button color changes based on validation
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
