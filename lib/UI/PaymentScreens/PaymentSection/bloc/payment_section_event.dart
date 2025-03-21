part of 'payment_section_bloc.dart';

@immutable
sealed class PaymentSectionEvent {}

class PaymentSectionContactSearchingEvent extends PaymentSectionEvent {
  final String number;
  PaymentSectionContactSearchingEvent({required this.number});
}
