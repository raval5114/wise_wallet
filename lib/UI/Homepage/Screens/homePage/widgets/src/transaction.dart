import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final bool isIncome;
  final String date;
  const Transaction(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.amount,
      required this.isIncome,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF8E2DE2).withOpacity(0.1),
          child: Icon(icon, color: Color(0xFF4A00E0)),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 18),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: TextStyle(
                  color: isIncome ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            Text(date, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
    ;
  }
}
