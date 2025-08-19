import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/UI/Auth/SignIn/bloc/sign_in_bloc.dart';
import 'package:wise_wallet/UI/Auth/SignIn/signIn.dart';
import 'package:wise_wallet/UI/Homepage/Homepage.dart';
import 'package:wise_wallet/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showPreloader = false; // Control the visibility of the preloader
  SignInBloc bloc = SignInBloc();
  @override
  void initState() {
    super.initState();

    _initaialSplashLoading();
  }

  void _initaialSplashLoading() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showPreloader = true;
        bloc.add(LoginOnSplashScreenEvent());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();

    return BlocConsumer<SignInBloc, SignInState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is SignInActionState,
      buildWhen: (previous, current) => current is! SignInActionState,
      listener: (context, state) {
        if (state is SignInUserLoggedInState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CustomHomePage(),
              ));
        }
        if (state is NavigateToRegisterPage) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            // Apply a linear gradient as the background
            decoration: BoxDecoration(
              gradient: customTheme!.navyBlackGradient,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Enlarged Icon or Logo
                  Image.asset(
                    "assets/app_logo.png",
                    height: 250.0, // Increased height
                    width: 250.0, // Increased width
                  ),
                  const SizedBox(height: 15.0),
                  // App Name
                  const Text(
                    'Wise Wallet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0, // Slightly larger font for the app name
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  // Subtitle (Cool Tagline)
                  const Text(
                    'Your Smart Financial Companion',
                    style: TextStyle(
                      color:
                          Colors.white70, // Softer white color for the subtitle
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic, // Italic for a stylish look
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Preloader
                  if (_showPreloader ==
                      true) // Show preloader only after the delay
                    const CircularProgressIndicator(
                      color: Colors.white, // Match the theme
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
