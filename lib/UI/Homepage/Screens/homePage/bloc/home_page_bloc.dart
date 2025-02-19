import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<NavigateToPINPortalEvent>(navigateToPinPortalEvent);
  }
  FutureOr<void> navigateToPinPortalEvent(
      NavigateToPINPortalEvent event, Emitter<HomePageState> emit) {
    emit(NavigateToPINPortalState());
  }
}
