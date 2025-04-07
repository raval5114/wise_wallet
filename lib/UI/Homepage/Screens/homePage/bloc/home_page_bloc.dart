import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/repos/homePageRepo.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<NavigateToPINPortalEvent>(navigateToPinPortalEvent);
    on<TransactionListFetchingEvent>((event, emit) async {
      try {
        HomePageRepo repo = HomePageRepo();
        emit(HomepageTransactionListLoadingState());
        List<Map<String, dynamic>> data = await repo.getTransactions(
            mobileNumber: int.parse(userSession.mobile!));
        debugPrint("Requested Data:${data}");
        //here send the List in reverse format
        data = data.reversed.toList();
        emit(HomepageTransactionListSuccessState(data: data));
      } catch (e) {
        emit(HomepageTransactionListErrorState(errorPage: e.toString()));
      }
    });
  }
  FutureOr<void> navigateToPinPortalEvent(
      NavigateToPINPortalEvent event, Emitter<HomePageState> emit) {
    emit(NavigateToPINPortalState());
  }
}
