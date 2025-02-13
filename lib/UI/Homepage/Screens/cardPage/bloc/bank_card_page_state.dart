part of 'bank_card_page_bloc.dart';

@immutable
sealed class BankCardPageState {}

class BankCardPageActionState extends BankCardPageState {}

class BankCardPageNavigateToAddAccountState extends BankCardPageActionState {}

class BankCardPageInitialState extends BankCardPageState {}

class BankCardPageLoadingState extends BankCardPageState {}

class BankCardPageSuccesState extends BankCardPageState {
  List<Banks> bankUserDetails;
  BankCardPageSuccesState({required this.bankUserDetails});
}

class BankCardPageErrorState extends BankCardPageState {
  String errorMsg;
  BankCardPageErrorState({required this.errorMsg});
}
