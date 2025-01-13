import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/widgets/src/actionButton.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 247,
        width: 340,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.white),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Balance",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  _isBalanceVisible ? "\$41,379.00" : "****",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 36.0, // Larger for emphasis
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isBalanceVisible = !_isBalanceVisible;
                    });
                  },
                  child: Icon(
                    _isBalanceVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.white70,
                    size: 24.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(icon: Icons.send, label: "Transfer"),
                ActionButton(icon: Icons.download, label: "Withdraw"),
                ActionButton(icon: Icons.list_alt, label: "Bills"),
                ActionButton(icon: Icons.subscriptions, label: "OTT"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
