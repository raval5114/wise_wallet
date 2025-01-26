import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/pieChartModel.dart';
import 'package:wise_wallet/Test/pie_chart_testing.dart';

class ExpenseTab extends StatefulWidget {
  const ExpenseTab({super.key});

  @override
  State<ExpenseTab> createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            WiseWalletPieChart(
              chartType: 'Expense',
              chartData: json['chartList'] ?? [],
              amount: 140000,
            ),
            ChartItemBreakdown(chartName: 'Expense', items: [])
          ],
        ),
      ),
    );
  }
}
