import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/bankAccount.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Homepage/Screens/cardPage/repos/cardPageRepo.dart';

part 'bank_card_page_event.dart';
part 'bank_card_page_state.dart';

class BankCardPageBloc extends Bloc<BankCardPageEvent, BankCardPageState> {
  BankCardPageBloc() : super(BankCardPageInitialState()) {
    on<BankCardPageInitialEvent>(bankCardPageInitialEvent);
  }
  FutureOr<void> bankCardPageInitialEvent(
      BankCardPageInitialEvent event, Emitter<BankCardPageState> emit) async {
    try {
      emit(BankCardPageLoadingState());
      Map<String, dynamic> listOfCard = await cardpagerepo.getAccountDetails();
      userSession.setBankAccountDetails(listOfCard);
      emit(BankCardPageSuccesState(
          bankUserDetails: userSession.userBankAccountDetails!.banks));
    } catch (err) {
      debugPrint("Error: $err");
      emit(BankCardPageErrorState(errorMsg: err.toString()));
    }
  }
}
