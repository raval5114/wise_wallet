part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

class HomepageActionState extends HomePageState {}

class NavigateToPINPortalState extends HomepageActionState {
  NavigateToPINPortalState() {
    homePageRepo.getBalance();
  }
}

class HomepageTransactionListLoadingState extends HomePageState {}

class HomepageTransactionListSuccessState extends HomePageState {
  final List<Map<String, dynamic>> data;
  HomepageTransactionListSuccessState({required this.data});
}

class HomepageTransactionListErrorState extends HomePageState {
  final String errorPage;
  HomepageTransactionListErrorState({required this.errorPage});
}

final class HomePageInitial extends HomePageState {}
