part of 'income_bloc.dart';

@immutable
sealed class IncomeEvent {}

final class IncomeInitialEvent extends IncomeEvent {}
