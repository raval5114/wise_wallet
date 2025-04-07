import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:wise_wallet/UI/Homepage/Screens/statePage/Screens/income/bloc/income_bloc.dart";
import "package:wise_wallet/UI/Homepage/Screens/statePage/Screens/src/pieChart.dart";
import 'package:wise_wallet/Data/pieChartModel.dart';

class IncomePieChart extends StatefulWidget {
  const IncomePieChart({super.key});

  @override
  State<IncomePieChart> createState() => _IncomePieChartState();
}

class _IncomePieChartState extends State<IncomePieChart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<IncomeBloc>().add(IncomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeBloc, IncomeState>(
      builder: (context, state) {
        if (state is IncomePageLoadingState) {
          return CircularProgressIndicator();
        }
        if (state is IncomePageSuccessState) {
          List<Map<String, dynamic>> chartList = state.data['incomeByCategory'];
          return WiseWalletPieChart(
            chartType: 'Income',
            chartData: chartList ?? [],
            amount: state.data['totalIncome'],
          );
        }
        if (state is IncomePageErrorState) {
          return SizedBox(
            child: Text("${state.errorMsg}"),
          );
        }
        return SizedBox();
      },
    );
  }
}
