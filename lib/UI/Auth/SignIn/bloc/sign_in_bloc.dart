import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Auth/SignIn/repos/auth.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<LoginScreenLoginEvent>(loginScreenLoginEvent);
    on<LoginScreenLogoutEvent>(loginScreenLogoutEvent);
    on<LoginOnSplashScreenEvent>(loginOnSplashScreenEvent);
    on<LogOutEvent>(logOutEvent);
  }

  FutureOr<void> loginScreenLogoutEvent(
      LoginScreenLogoutEvent event, Emitter<SignInState> emit) async {
    try {
      auth.signOut();
      emit(LoginScreenLoggedOutState());
    } catch (err) {
      emit(SignINUserLoginErrorState(error: err.toString()));
    }
  }

  FutureOr<void> loginOnSplashScreenEvent(
      LoginOnSplashScreenEvent event, Emitter<SignInState> emit) async {
    // Initialize secure storage only once (if not already initialized)
    final SharedPreferences storage = await SharedPreferences.getInstance();

    try {
      emit(SignInUSerLoginLoadingState());

      final token = await storage.getString("token");
      if (token != null) {
        final decoded = JWT.decode(token);
        String emailOrMobile = decoded.payload["email"];
        String password = decoded.payload["password"];
        // Attempt login
        try {
          await auth.signin(
              emailOrMobile, password); // Await the sign-in process
          await auth.getDashBoard(token);
          debugPrint("${userSession.firstName}\n ${userSession.lastName}");
          debugPrint("${userSession.email}\n ${userSession.mobile}");
          emit(SignInUserLoggedInState());
        } catch (authError) {
          debugPrint("Authentication failed: $authError");
          emit(NavigateToRegisterPage());
        }
      } else {
        // Navigate to registration/login if credentials are missing
        emit(NavigateToRegisterPage());
      }
    } catch (err) {
      debugPrint("Error during splash login: ${err.toString()}");
      emit(SignINUserLoginErrorState(error: err.toString()));
    }
  }

  FutureOr<void> logOutEvent(
      LogOutEvent event, Emitter<SignInState> emit) async {
    auth.signOut();
    emit(LogOutState());
  }

  FutureOr<void> loginScreenLoginEvent(
      LoginScreenLoginEvent event, Emitter<SignInState> emit) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    try {
      emit(SignInUSerLoginLoadingState());
      debugPrint("Loading");
      await auth.signin(event.emailOrMobileNo, event.password);

      final token = storage.getString("token");

      debugPrint("Signed In Token = $token");
      await auth.getDashBoard(token!);

      emit(SignInUserLoggedInState());
      debugPrint("UserLoggedIn");
    } catch (err) {
      emit(SignINUserLoginErrorState(error: err.toString()));
    }
  }
}
