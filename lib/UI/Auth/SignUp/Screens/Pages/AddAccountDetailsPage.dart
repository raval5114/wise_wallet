import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/UI/Auth/SignUp/Screens/src/addAccount.dart';
import 'package:wise_wallet/UI/Auth/SignUp/bloc/sign_up_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Homepage.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/homePage.dart';
import 'package:wise_wallet/main.dart';

class AddAccountDetailsPage extends StatefulWidget {
  const AddAccountDetailsPage({super.key});

  @override
  State<AddAccountDetailsPage> createState() => _AddAccountDetailsPageState();
}

class _AddAccountDetailsPageState extends State<AddAccountDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();
    final SignUpBloc bloc = SignUpBloc();

    return BlocConsumer<SignUpBloc, SignUpState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is SignUpActionState,
      buildWhen: (previous, current) => current is! SignUpActionState,
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          debugPrint("Loading");
        }
        if (state is SignUpSucessState) {
          debugPrint("SignInCompleted");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CustomHomePage(),
            ),
          );
        }
        if (state is SignUpErrorState) {
          debugPrint("Error: ${state.error}");
        }
      },
      builder: (context, state) {
        bool isLoading = state is SignUpLoadingState;

        return Scaffold(
          body: Stack(
            children: [
              // Background Gradient
              Container(
                decoration:
                    BoxDecoration(gradient: customTheme?.navyBlackGradient),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AddAccountDetails(),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 10),
                  child: TextButton(
                    onPressed: () {
                      bloc.add(SignUpScreenSignInEvent());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              if (isLoading)
                // Preloader Overlay
                Container(
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
