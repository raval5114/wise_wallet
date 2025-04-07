import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'income_event.dart';
part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  IncomeBloc() : super(IncomeInitial()) {
    on<IncomeInitialEvent>((event, emit) async {
      try {
        emit(IncomePageLoadingState());
        Map<String, dynamic> data = {
          "totalIncome": 111732.00,
          "incomeByCategory": [
            {"Income": 22000.00},
            {"Any Category": 1000.00},
            {"Investment": 81500.00},
            {"new income category": 1500.00},
            {"Salary": 2232.00},
            {"allowance": 1500.00},
            {"New Allowance": 2000.00}
          ]
        };
        emit(IncomePageSuccessState(data: data));
      } catch (e) {
        emit(IncomePageErrorState(errorMsg: e.toString()));
      }
    });
  }
}
