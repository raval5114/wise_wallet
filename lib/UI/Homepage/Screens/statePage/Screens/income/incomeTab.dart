import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/income/Widgets/incomeBreakdown.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/income/Widgets/incomePieChart.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/src/amountBreakdown.dart';

class IncomeTab extends StatefulWidget {
  const IncomeTab({super.key});

  @override
  State<IncomeTab> createState() => _IncomeTabState();
}

class _IncomeTabState extends State<IncomeTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [IncomePieChart(), IncomeChartBreakdown()],
        ),
      ),
    );
  }
}
