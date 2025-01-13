import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Auth/SignIn/widgets/src/titleAndSubtitle.dart';
import 'package:wise_wallet/UI/Auth/SignIn/widgets/src/userForm.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Register.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isVisible = false; // Controls animation trigger

  @override
  void initState() {
    super.initState();
    // Trigger animation after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isVisible = true; // Start the slide-in animation
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Welcome Back Text with Slide Animation
        AnimatedSlide(
          offset: _isVisible
              ? Offset(0, 0)
              : Offset(-1, 0), // Slide in from the left
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: TitleAndSubtitle(),
        ),
        SizedBox(height: 20),

        // Email Field with Slide Animation
        AnimatedSlide(
          offset: _isVisible
              ? Offset(0, 0)
              : Offset(1, 0), // Slide in from the right
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: Userform(),
        ),
        SizedBox(height: 20),

        // Social Media Buttons with Slide Animation
        AnimatedSlide(
          offset: _isVisible
              ? Offset(0, 0)
              : Offset(0, 1), // Slide in from the bottom
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          child: GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegisterScreen())),
            child: Text(
              "New User?? Click here",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
