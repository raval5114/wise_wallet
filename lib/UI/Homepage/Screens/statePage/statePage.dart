import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/expense/expenseTab.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/income/incomeTab.dart';

class StatePage extends StatefulWidget {
  const StatePage({super.key});

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Statistics"),
          actions: [
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text("May 2024", style: TextStyle(color: Colors.black)),
                  Icon(Icons.arrow_drop_down, color: Colors.black),
                ],
              ),
            ),
          ],
          bottom: TabBar(tabs: [
            Tab(
              text: "Income",
            ),
            Tab(
              text: "Expense",
            )
          ]),
        ),
        body: TabBarView(children: [IncomeTab(), ExpenseTab()]),
      ),
    );
  }
}
