import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/expense/bloc/expenses_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/expense/expenseTab.dart';
import 'package:wise_wallet/UI/Homepage/Screens/statePage/Screens/income/bloc/income_bloc.dart';
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
          title: Text(
            "Statistics",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text("May 2024", style: TextStyle(color: Colors.white)),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4A00E0), Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          bottom: TabBar(tabs: [
            Tab(
              text: "Income",
            ),
            Tab(
              text: "Expense",
            )
          ]),
        ),
        body: TabBarView(
          children: [
            BlocProvider(create: (context) => IncomeBloc(), child: IncomeTab()),
            BlocProvider(
                create: (context) => ExpensesBloc(), child: ExpenseTab())
          ],
        ),
      ),
    );
  }
}
