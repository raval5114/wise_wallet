import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/pieChartModel.dart';
import 'package:wise_wallet/Test/pie_chart_testing.dart';

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
          children: [
            WiseWalletPieChart(
              chartType: 'Income',
              chartData: json['chartList'] ?? [],
              amount: 140000,
            ),
            ChartItemBreakdown(chartName: 'Income', items: [])
          ],
        ),
      ),
    );
  }
}
