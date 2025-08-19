part of 'scanning_payment_bloc.dart';

@immutable
sealed class ScanningPaymentState {}

final class ScanningPaymentInitial extends ScanningPaymentState {}

final class ScanningPaymentActionState extends ScanningPaymentState {}

final class ScanningPaymentLoading extends ScanningPaymentActionState {}

final class ScanningPaymentSuccess extends ScanningPaymentActionState {
  ScanningPaymentSuccess();
}

final class ScanningPaymentError extends ScanningPaymentState {
  final String error;

  ScanningPaymentError(this.error);
}
