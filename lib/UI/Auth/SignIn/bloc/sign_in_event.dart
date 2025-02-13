part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class LoginScreenLoginEvent extends SignInEvent {
  final String emailOrMobileNo;
  final String password;
  LoginScreenLoginEvent(
      {required this.emailOrMobileNo, required this.password});
}

class LoginOnSplashScreenEvent extends SignInEvent {}

class LogOutEvent extends SignInEvent {}

class LoginScreenLogoutEvent extends SignInEvent {}
