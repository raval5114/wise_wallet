import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/expense/Widgets/expenseBreakdown.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/expense/Widgets/expensePiechart.dart';

class ExpenseTab extends StatefulWidget {
  const ExpenseTab({super.key});

  @override
  State<ExpenseTab> createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
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
          children: [ExpensePieChart(), ExpensesBreakdown()],
        )));
  }
}
