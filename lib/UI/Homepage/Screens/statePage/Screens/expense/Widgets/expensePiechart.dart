import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/expense/bloc/expenses_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/src/pieChart.dart';

class ExpensePieChart extends StatefulWidget {
  const ExpensePieChart({super.key});

  @override
  State<ExpensePieChart> createState() => _ExpensePieChartState();
}

class _ExpensePieChartState extends State<ExpensePieChart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpensesBloc>().add(LoadExpensesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesBloc, ExpensesState>(
      builder: (context, state) {
        if (state is ExpensesPageLoadingState) {
          return CircularProgressIndicator();
        }
        if (state is ExpensesPageSuccessState) {
          debugPrint("${state.data}");
          Map<String, dynamic> chartData = state.data;
          return WiseWalletPieChart(
              chartType: "Expense",
              chartData: chartData['expenseByCategory'],
              amount: chartData['totalExpense']);
        }
        if (state is ExpensesPageErrorState) {
          return Center(
            child: Text("${state.errorMsg}"),
          );
        }
        return SizedBox();
      },
    );
  }
}
