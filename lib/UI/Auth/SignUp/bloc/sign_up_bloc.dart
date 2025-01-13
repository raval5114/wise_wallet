import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Auth/SignUp/repos/signup.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpScreenSignInEvent>(signUpScreenSignInEvent);
  }
  FutureOr<void> signUpScreenSignInEvent(
      SignUpScreenSignInEvent event, Emitter<SignUpState> emit) async {
    try {
      emit(SignUpLoadingState());
      await signUp.signUp(regUser.toJson());
      emit(SignUpSucessState());
    } catch (err) {
      emit(SignUpErrorState(error: err.toString()));
    }
  }
}
