part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInActionState extends SignInState {}

class SignInInitial extends SignInState {}

class SignInUserLoggedInState extends SignInActionState {}

class NavigateToRegisterPage extends SignInActionState {}

class LoginScreenLoggedOutState extends SignInActionState {}

class SignInUSerLoginLoadingState extends SignInActionState {}

class LogOutState extends SignInActionState {}

class SignINUserLoginErrorState extends SignInActionState {
  final String error;

  SignINUserLoginErrorState({required this.error});
}

class LoginScreenLogOutErrorState extends SignInActionState {
  final String error;

  LoginScreenLogOutErrorState({required this.error});
}
