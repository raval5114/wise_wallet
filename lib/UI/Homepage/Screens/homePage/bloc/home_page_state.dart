part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

class HomepageActionState extends HomePageState {}

class NavigateToPINPortalState extends HomepageActionState {
  NavigateToPINPortalState() {
    homePageRepo.getBalance();
  }
}

final class HomePageInitial extends HomePageState {}
