import 'package:flutter/material.dart';

import 'package:wise_wallet/UI/Homepage/Screens/homePage/widgets/src/transaction.dart'; // For date formatting

class Transactionlist extends StatefulWidget {
  const Transactionlist({super.key});

  @override
  State<Transactionlist> createState() => _TransactionlistState();
}

class _TransactionlistState extends State<Transactionlist> {
  // Sample data for transactions
  List<Map<String, dynamic>> transactions = [
    {
      "icon": Icons.video_library,
      "title": "YouTube",
      "subtitle": "Subscription Payment",
      "amount": "-\$15.00",
      "isIncome": false,
      "date": DateTime(2024, 5, 16),
    },
    {
      "icon": Icons.attach_money,
      "title": "Stripe",
      "subtitle": "Monthly Salary",
      "amount": "+\$3000.00",
      "isIncome": true,
      "date": DateTime(2024, 5, 15),
    },
    {
      "icon": Icons.book,
      "title": "Google Play",
      "subtitle": "E-book Purchase",
      "amount": "-\$12.99",
      "isIncome": false,
      "date": DateTime(2024, 5, 14),
    },
    {
      "icon": Icons.money,
      "title": "OVO",
      "subtitle": "Top Up E-Money",
      "amount": "-\$180.00",
      "isIncome": false,
      "date": DateTime(2024, 5, 18),
    },
    {
      "icon": Icons.money,
      "title": "OVO",
      "subtitle": "Top Up E-Money",
      "amount": "-\$180.00",
      "isIncome": false,
      "date": DateTime(2024, 5, 18),
    },
    {
      "icon": Icons.money,
      "title": "OVO",
      "subtitle": "Top Up E-Money",
      "amount": "-\$180.00",
      "isIncome": false,
      "date": DateTime(2024, 5, 18),
    },
    {
      "icon": Icons.money,
      "title": "OVO",
      "subtitle": "Top Up E-Money",
      "amount": "-\$180.00",
      "isIncome": false,
      "date": DateTime(2024, 5, 18),
    },
    {
      "icon": Icons.money,
      "title": "OVO",
      "subtitle": "Top Up E-Money",
      "amount": "-\$180.00",
      "isIncome": false,
      "date": DateTime(2024, 5, 18),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text(
              "Recent Transactions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          // Wrap ListView.builder with Container to ensure size is fixed
          SizedBox(
            height: 400, // Fixed height for the list inside SizedBox
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                var transaction = transactions[index];
                return Transaction(
                  icon: Icons.video_call,
                  title: "Title",
                  subtitle: "Subtitle",
                  amount: "000000",
                  isIncome: false,
                  date: transaction['date'].toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
