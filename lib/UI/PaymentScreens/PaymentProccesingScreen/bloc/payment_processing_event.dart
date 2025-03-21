part of 'payment_processing_bloc.dart';

@immutable
class PaymentProcessingEvent {
  final Map<String, dynamic> data;
  PaymentProcessingEvent({required this.data});
}
