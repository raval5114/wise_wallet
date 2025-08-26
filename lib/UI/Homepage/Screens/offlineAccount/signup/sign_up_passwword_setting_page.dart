import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/offlineAccount/signup/bloc/wallet_sign_up_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/offlineAccount/signup/widgets/sign_up_password_setting_component..dart';
import 'package:wise_wallet/main.dart';

class SignUpPasswwordSettingPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  const SignUpPasswwordSettingPage(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();

    return BlocProvider(
      create: (context) => WalletSignUpBloc(),
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: customTheme!.navyBlackGradient),
            child: Center(
                child: SignUpPasswordSettingComponent(
              firstName: firstName,
              lastName: lastName,
              email: email,
              mobileNo: mobileNumber,
            ))),
      ),
    );
  }
}
