import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/bloc/payment_section_bloc.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/sections/PaymentAcknowledgementSection.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/sections/bankDetailsSection.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/sections/bankSelectionSection.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/sections/contactNumberSearchingSection.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/sections/paymentAmountSection.dart';

class PaymentSectionViaNumber extends StatefulWidget {
  const PaymentSectionViaNumber({super.key});

  @override
  State<PaymentSectionViaNumber> createState() =>
      _PaymentSectionViaNumberState();
}

class _PaymentSectionViaNumberState extends State<PaymentSectionViaNumber> {
  int currentContainer = 0;
  Map<String, dynamic> sharedData = {};

  double getContainerHeight() {
    switch (currentContainer) {
      case 0:
        return 500;
      case 1:
        return 531;
      case 2:
        return 650;
      case 3:
        return 800;
      case 4:
        return 450;
      default:
        return 500;
    }
  }

  void switchContainer(int containerNumber, Map<String, dynamic>? newData) {
    setState(() {
      currentContainer = containerNumber;
      if (newData != null) {
        sharedData = newData;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: double.infinity,
      height: getContainerHeight(),
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the bottom sheet
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Text(
                    "Payment Section",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 48), // To balance close button spacing
              ],
            ),
          ),
          BlocProvider(
            create: (context) => PaymentSectionBloc(),
            child: Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 180),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final offsetAnimation = Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(animation);
                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
                child: currentContainer == 0
                    ? ContactNumberSearchingSection(
                        key: ValueKey<int>(0),
                        onNavigate: switchContainer,
                      )
                    : currentContainer == 1
                        ? BankDetailsSection(
                            key: ValueKey<int>(1),
                            onNavigate: switchContainer,
                            data: sharedData,
                          )
                        : currentContainer == 2
                            ? BankSelectionSection(
                                key: ValueKey<int>(3),
                                onNavigate: switchContainer,
                                data: sharedData,
                              )
                            : currentContainer == 3
                                ? PaymentAmountSection(
                                    key: ValueKey<int>(2),
                                    onNavigate: switchContainer,
                                    data: sharedData,
                                  )
                                : PaymentAcknowledgementSection(
                                    key: ValueKey<int>(4),
                                    onNavigate: switchContainer,
                                    data: sharedData,
                                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
