part of 'payment_section_bloc.dart';

@immutable
sealed class PaymentSectionState {}

final class PaymentSectionInitial extends PaymentSectionState {}

class PaymentSectionActionState extends PaymentSectionState {}

class PaymentSectionContactSearchingLoadingState extends PaymentSectionState {}

class PaymentSectionContactSearchingSuccessState extends PaymentSectionState {
  List<Map<String, dynamic>> data;
  PaymentSectionContactSearchingSuccessState({required this.data});
}

class PaymentSectionErrorState extends PaymentSectionState {
  String error;
  PaymentSectionErrorState({required this.error});
}
