part of 'income_bloc.dart';

@immutable
sealed class IncomeState {}

final class IncomeInitial extends IncomeState {}

final class IncomePageLoadingState extends IncomeState {}

final class IncomePageSuccessState extends IncomeState {
  final Map<String, dynamic> data;
  IncomePageSuccessState({required this.data});
}

final class IncomePageErrorState extends IncomeState {
  String errorMsg;
  IncomePageErrorState({required this.errorMsg});
}
