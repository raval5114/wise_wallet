import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Auth/SignIn/repos/auth.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<LoginScreenLoginEvent>(loginScreenLoginEvent);
    on<LoginScreenLogoutEvent>(loginScreenLogoutEvent);
    on<LoginOnSplashScreenEvent>(loginOnSplashScreenEvent);
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
    final FlutterSecureStorage storage = FlutterSecureStorage();

    try {
      emit(SignInUSerLoginLoadingState());

      // Read credentials from secure storage
      final emailOrMobile = await storage.read(key: "emailOrMobile");
      final password = await storage.read(key: "password");

      if (emailOrMobile != null && password != null) {
        // Attempt login
        try {
          await auth.signin(
              emailOrMobile, password); // Await the sign-in process
          debugPrint("${userSession.firstName}\n ${userSession.lastName}");
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
}

FutureOr<void> loginScreenLoginEvent(
    LoginScreenLoginEvent event, Emitter<SignInState> emit) async {
  try {
    emit(SignInUSerLoginLoadingState());
    debugPrint("Loading");
    await auth.signin(event.emailOrMobileNo, event.password);
    emit(SignInUserLoggedInState());
    debugPrint("UserLoggedIn");
  } catch (err) {
    emit(SignINUserLoginErrorState(error: err.toString()));
  }
}
