part of 'payment_processing_bloc.dart';

@immutable
sealed class PaymentProcessingState {}

final class PaymentProcessingInitial extends PaymentProcessingState {}

final class PaymentProcessActionstate extends PaymentProcessingState {}

final class PaymentProcessLoadingstate extends PaymentProcessingState {}

final class PaymentProcessSuccessState extends PaymentProcessingState {
  final Map<String, dynamic> data;
  PaymentProcessSuccessState({required this.data});
}

final class PaymentProcessErrorState extends PaymentProcessingState {
  final String errorMessage;
  PaymentProcessErrorState({required this.errorMessage});
}
