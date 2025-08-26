part of 'wallet_sign_up_bloc.dart';

@immutable
sealed class WalletSignUpState {}

final class WalletSignUpInitial extends WalletSignUpState {}

final class WalletSignupLoadingState extends WalletSignUpState {}

final class WalletSignupSuccessfullState extends WalletSignUpState {}

final class WalletSignupErrorMsg extends WalletSignUpState {
  final String errMsg;

  WalletSignupErrorMsg({required this.errMsg});
}
