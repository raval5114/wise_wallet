import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/Data/bankAccount.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/Homepage/Screens/cardPage/bloc/bank_card_page_bloc.dart';
import 'package:wise_wallet/UI/Homepage/Screens/cardPage/widgets/accountCard.dart';

class Accountlist extends StatefulWidget {
  const Accountlist({super.key});

  @override
  State<StatefulWidget> createState() => _AccountListState();
}

class _AccountListState extends State<Accountlist> {
  BankCardPageBloc bloc = BankCardPageBloc();
  @override
  void initState() {
    super.initState();
    bloc.add(BankCardPageInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bloc,
      listenWhen: (previous, current) => current is BankCardPageActionState,
      buildWhen: (previous, current) => current is! BankCardPageActionState,
      builder: (context, state) {
        if (state is BankCardPageLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BankCardPageSuccesState) {
          List<Banks> userBank = userSession.userBankAccountDetails!.banks;
          if (userSession != null) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: userBank.length,
              itemBuilder: (context, index) => AccountCard(
                bankName: '${userBank[index].bankName}',
                accountNumber: '${userBank?[index].accountNumber}',
                balance: '${userBank?[index].balance}',
                isVisa: true,
              ),
            );
          } else {
            return Center(
              child: Text("No Banks Available on this account"),
            );
          }
        } else {
          return SizedBox();
        }
      },
      listener: (context, state) => debugPrint("Navigating"),
    );
  }
}
