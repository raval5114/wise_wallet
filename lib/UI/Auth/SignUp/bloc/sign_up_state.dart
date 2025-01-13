part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

abstract class SignUpActionState extends SignUpState {}

final class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpActionState {}

class SignUpSucessState extends SignUpActionState {}

class SignUpErrorState extends SignUpActionState {
  String error;
  SignUpErrorState({required this.error});
}
