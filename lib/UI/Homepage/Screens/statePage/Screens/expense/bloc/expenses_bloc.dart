import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:wise_wallet/UI/Homepage/Screens/statePage/repos/statePageRepo.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  ExpensesBloc() : super(ExpensesState()) {
    on<LoadExpensesEvent>(_onLoadExpenses);
  }

  Future<void> _onLoadExpenses(
      LoadExpensesEvent event, Emitter<ExpensesState> emit) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        emit(ExpensesPageErrorState(errorMsg: "Token not found"));
        return;
      }

      emit(ExpensesPageLoadingState());
      Map<String, dynamic> data = {
        "totalExpense": 50970.00,
        "expenseByCategory": [
          {"Food": 1745.00},
          {"Housing": 500.00},
          {"Bills": 21100.00},
          {"Transfer": 20425.00},
          {"New expense": 1500.00},
          {"new category": 2700.00},
          {"My new category": 1500.00},
          {"new categoty": 1500.00},
        ]
      };

      debugPrint("Fetched Expenses Data: $data");

      emit(ExpensesPageSuccessState(data: data));
    } catch (e) {
      debugPrint("Error in ExpensesBloc: $e");
      emit(ExpensesPageErrorState(errorMsg: e.toString()));
    }
  }
}
