part of 'scanning_payment_bloc.dart';

@immutable
sealed class ScanningPaymentEvent {}

final class ScanningEvent extends ScanningPaymentEvent {
  ScanningEvent();
}
