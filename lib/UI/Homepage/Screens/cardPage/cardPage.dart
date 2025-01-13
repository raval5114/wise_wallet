import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/Homepage/Screens/cardPage/widgets/accountList.dart';
import 'package:wise_wallet/main.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();

    return ListView(
      children: [
        Stack(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: customTheme!.navyBlackGradient,
              ),
            ),
            AppBar(
              title: const Text(
                "Existing Accounts",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Add action for adding a new account
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 600, child: Accountlist()),
      ],
    );
  }
}
