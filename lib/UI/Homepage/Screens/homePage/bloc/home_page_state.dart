part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

class HomepageActionState extends HomePageState {}

class NavigateToPINPortalState extends HomepageActionState {
  NavigateToPINPortalState() {
    debugPrint("Navigate To the Pin Screen");
  }
}

final class HomePageInitial extends HomePageState {}
