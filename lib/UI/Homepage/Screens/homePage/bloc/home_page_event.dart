part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class NavigateToPINPortalEvent extends HomePageEvent {}

class TransactionListFetchingEvent extends HomePageEvent {}
