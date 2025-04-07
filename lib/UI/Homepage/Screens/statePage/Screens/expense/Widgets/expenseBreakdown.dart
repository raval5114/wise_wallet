import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/expense/bloc/expenses_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/src/amountBreakdown.dart';

class ExpensesBreakdown extends StatefulWidget {
  const ExpensesBreakdown({super.key});

  @override
  State<ExpensesBreakdown> createState() => _ExpensesBreakdownState();
}

class _ExpensesBreakdownState extends State<ExpensesBreakdown> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpensesBloc>().add(LoadExpensesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesBloc, ExpensesState>(builder: (context, state) {
      if (state is ExpensesPageLoadingState) {
        return CircularProgressIndicator();
      }
      if (state is ExpensesPageSuccessState) {
        debugPrint("${state.data}");
        Map<String, dynamic> chartData = state.data;
        return ChartItemBreakdown(
            chartName: 'Expense', items: chartData['expenseByCategory']);
      }
      if (state is ExpensesPageErrorState) {
        return Center(
          child: Text("${state.errorMsg}"),
        );
      }
      return SizedBox();
    });
  }
}
