import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/cardPage/widgets/accountCard.dart';

class Accountlist extends StatefulWidget {
  const Accountlist({super.key});

  @override
  State<StatefulWidget> createState() => _AccountListState();
}

class _AccountListState extends State<Accountlist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) => AccountCard(
        bankName: 'SBI',
        accountNumber: '123456789012',
        balance: '1234567',
        isVisa: false,
      ),
    );
  }
}
