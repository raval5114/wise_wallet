import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Auth/SignUp/repos/signup.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  void initState() {
    signUp.signUp({
      "firstName": "Jane",
      "lastName": "Doe",
      "email": "janeBhaiDoe123@gmail.com",
      "mobile": "9574035114",
      "dob": "05/11/2004"
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SignUp"),
      ),
    );
  }
}
