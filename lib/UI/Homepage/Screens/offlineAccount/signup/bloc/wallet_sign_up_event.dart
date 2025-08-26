part of 'wallet_sign_up_bloc.dart';

@immutable
sealed class WalletSignUpEvent {}

final class WalletPageSignupEvent extends WalletSignUpEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String password;
  WalletPageSignupEvent(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.mobileNumber,
      required this.password});
}
