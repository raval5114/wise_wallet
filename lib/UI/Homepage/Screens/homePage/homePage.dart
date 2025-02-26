import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/bloc/home_page_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/widgets/src/appbar.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/widgets/balanceCard.dart';
import 'package:wise_wallet/UI/Homepage/Screens/homePage/widgets/transactionList.dart';
import 'package:wise_wallet/main.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clearingRecords();
  }

  void clearingRecords() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('balance');
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>();

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: customTheme!.navyBlackGradient,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                appBar(), //       // Balance Card with Tween Animation
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 1),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, 50 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: BlocProvider(
                    create: (context) => HomePageBloc(),
                    child: BalanceCard(),
                  ),
                ),
                const SizedBox(height: 10),
                //       // Recent Transactions with Animation
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 360),
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(milliseconds: 900),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 50 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: Transactionlist(),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
