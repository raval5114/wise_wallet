import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';

class AccountCard extends StatefulWidget {
  final String bankName;
  final String accountNumber;
  final String balance;
  final bool isVisa;

  AccountCard({
    super.key,
    required this.bankName,
    required this.accountNumber,
    required this.balance,
    required this.isVisa,
  });

  @override
  _AccountCardState createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  late int colorNo;

  @override
  void initState() {
    super.initState();
    colorNo = Random().nextInt(10); // Random number generated once
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: appThemes[1]!, // Safe access using non-null assertion
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.bankName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "₹${widget.balance}",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Balance",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "**** **** ${widget.accountNumber.length >= 4 ? widget.accountNumber.substring(widget.accountNumber.length - 4) : widget.accountNumber}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.isVisa ? "Visa" : "MasterCard",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Map<int, LinearGradient> appThemes = {
  1: LinearGradient(
    colors: [
      Color(0xFF8E2DE2), // Purple
      Color(0xFF4A00E0), // Blue
      Color(0xFF2C0064), // Dark Purple (added)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  2: LinearGradient(
    colors: [
      Color(0xFFFF6E7F), // Pink
      Color(0xFFFFB88C), // Orange
      Color(0xFFB23A00), // Dark Orange (added)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  3: LinearGradient(
    colors: [
      Color(0xFF11998E), // Teal
      Color(0xFF38EF7D), // Green
      Color(0xFF00695C), // Dark Teal (added)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  4: LinearGradient(
    colors: [
      Color(0xFF2193B0), // Blue
      Color(0xFF6DD5ED), // Cyan
      Color(0xFF0D4F78), // Dark Blue (added)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  5: LinearGradient(
    colors: [
      Color(0xFFFF512F), // Red
      Color(0xFFDD2476), // Yellow
      Color(0xFFB21F51), // Dark Red (added)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  6: LinearGradient(
    colors: [
      Color(0xFF56CCF2), // Light Blue
      Color(0xFF2F80ED), // Dark Blue
      Color(0xFF1A4B78), // Deep Blue (added)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  7: LinearGradient(
    colors: [
      Color(0xFFFBC2EB), // Light Pink
      Color(0xFFA6C1EE), // Light Blue
      Color(0xFF4B6C9F), // Dark Blue (added)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  8: LinearGradient(
    colors: [
      Color(0xFFB2FEFA), // Light Cyan
      Color(0xFF0ED2F7), // Bright Cyan
      Color(0xFF006F85), // Dark Cyan (added)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  9: LinearGradient(
    colors: [
      Color(0xFFFDEB71), // Light Yellow
      Color(0xFFF8D800), // Yellow
      Color(0xFFB78A00), // Dark Yellow (added)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  10: LinearGradient(
    colors: [
      Color(0xFFA18CD1), // Soft Purple
      Color(0xFFFBC2EB), // Soft Pink
      Color(0xFF6A4C9C), // Dark Purple (added)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
};
