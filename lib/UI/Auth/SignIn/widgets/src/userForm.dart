import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wise_wallet/UI/Auth/SignIn/bloc/sign_in_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Homepage.dart';

class Userform extends StatefulWidget {
  const Userform({super.key});

  @override
  State<Userform> createState() => _UserformState();
}

class _UserformState extends State<Userform> {
  bool _obscurePassword = true; // State variable to toggle password visibility
  final SignInBloc bloc = SignInBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loadingInSignIn = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is SignInActionState,
      buildWhen: (previous, current) => current is! SignInActionState,
      listener: (context, state) {
        if (state is SignInUSerLoginLoadingState) {
          setState(() {
            _loadingInSignIn = true;
          });
          debugPrint("Loading state triggered");
        } else if (state is SignInUserLoggedInState) {
          setState(() {
            _loadingInSignIn = false;
          });
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CustomHomePage(),
              ));
          debugPrint("User logged in successfully");
        } else if (state is SignINUserLoginErrorState) {
          setState(() {
            _loadingInSignIn = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
          debugPrint("Error: ${state.error}");
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            // Email Field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email or Mobile Number",
                hintStyle: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.email, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),

            // Password Field with Toggle Option
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              obscureText: _obscurePassword,
            ),
            const SizedBox(height: 20),

            // Sign In Button
            ElevatedButton(
              onPressed: _loadingInSignIn
                  ? null
                  : () {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Fields cannot be empty")),
                        );
                        return;
                      }

                      bloc.add(LoginScreenLoginEvent(
                          emailOrMobileNo: email, password: password));
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: _loadingInSignIn
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    )
                  : Text(
                      "Sign In",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
