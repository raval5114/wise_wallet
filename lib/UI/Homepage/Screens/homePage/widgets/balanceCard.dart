import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/bloc/home_page_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/repos/homePageRepo.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/widgets/src/actionButton.dart';
import 'package:wise_wallet/UI/PaymentScreens/PasswordEnteringScreen/passwordScreen.dart';
import 'package:intl/intl.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  late final SharedPreferences prefs;
  bool _isBalanceVisible = false;
  late String balc;

  @override
  void initState() {
    super.initState();
    checkingBalanceVisiblity();
  }

  void checkingBalanceVisiblity() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('balance') != null) {
      setState(() {
        int balance = prefs.getInt('balance')!;
        balc = NumberFormat.currency(
          locale: 'en_IN',
          symbol: '',
          decimalDigits: 0,
        ).format(balance);
        _isBalanceVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listenWhen: (previous, current) => current is HomepageActionState,
      listener: (context, state) {
        if (state is NavigateToPINPortalState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordScreen(
                callBack: () => homePageRepo.getBalance(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 247,
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
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
                InkWell(
                  onTap: () {
                    context
                        .read<HomePageBloc>()
                        .add(NavigateToPINPortalEvent());
                  },
                  child: Text(
                    _isBalanceVisible ? "Rs.$balc" : "Check Balance",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
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
      },
    );
  }
}
