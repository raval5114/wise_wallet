import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/income/bloc/income_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/src/amountBreakdown.dart';

class IncomeChartBreakdown extends StatefulWidget {
  const IncomeChartBreakdown({super.key});

  @override
  State<IncomeChartBreakdown> createState() => _IncomeChartBreakdownState();
}

class _IncomeChartBreakdownState extends State<IncomeChartBreakdown> {
  @override
  void initState() {
    super.initState();
    context.read<IncomeBloc>().add(IncomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeBloc, IncomeState>(
      builder: (context, state) {
        if (state is IncomePageLoadingState) {
          return CircularProgressIndicator();
        } else if (state is IncomePageSuccessState) {
          List<Map<String, double>> items = state.data['incomeByCategory'];
          return ChartItemBreakdown(chartName: 'Income', items: items);
        } else if (state is IncomePageErrorState) {
          return Center(
            child: Text("${state.errorMsg}"),
          );
        }
        return SizedBox();
      },
    );
  }
}
