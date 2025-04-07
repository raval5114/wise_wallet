part of 'expenses_bloc.dart';

@immutable
class ExpensesState {}

final class ExpensesPageActionState extends ExpensesState {}

final class ExpensesPageLoadingState extends ExpensesState {}

final class ExpensesPageSuccessState extends ExpensesState {
  final Map<String, dynamic> data;
  ExpensesPageSuccessState({required this.data});
}

final class ExpensesPageErrorState extends ExpensesState {
  String errorMsg;
  ExpensesPageErrorState({required this.errorMsg});
}
