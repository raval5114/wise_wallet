import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/bloc/home_page_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/widgets/src/transaction.dart';

class Transactionlist extends StatefulWidget {
  const Transactionlist({super.key});

  @override
  State<Transactionlist> createState() => _TransactionlistState();
}

class _TransactionlistState extends State<Transactionlist> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomePageBloc>(context)
        .add(TransactionListFetchingEvent()); // Fetch transactions
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listenWhen: (previous, current) => current is HomepageActionState,
      buildWhen: (previous, current) => current is! HomepageActionState,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomepageTransactionListLoadingState) {
          return _buildShimmerLoading();
        } else if (state is HomepageTransactionListSuccessState) {
          return _buildTransactionList(state.data);
        } else if (state is HomepageTransactionListErrorState) {
          return Center(
            child: Text("Error:${state.errorPage}"),
          );
        } else {
          return const Center(child: Text("No transactions available"));
        }
      },
    );
  }

  /// **Shimmer Effect while loading**
  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// **Transaction List UI**
  Widget _buildTransactionList(List<Map<String, dynamic>> transactions) {
    if (transactions.isEmpty) {
      return const Center(child: Text("No transactions available"));
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Recent Transactions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                var transaction = transactions[index];
                return Transaction(
                  icon: transaction['icon'] ??
                      Icons.attach_money, // Default icon if missing
                  title: transaction['title'] ?? "Unknown",
                  subtitle: transaction['category'] ?? "No details",
                  amount: transaction['amount'].toString() ?? "\$0.00",
                  isIncome: transaction['transactionType'] == 'Expense'
                      ? false
                      : true,
                  date: transaction['time'].toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
