import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/UI/PaymentScreens/PasswordEnteringScreen/passwordScreen.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentProccesingScreen/bloc/payment_processing_bloc.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentProccesingScreen/paymentProccessingScreen.dart';

class PaymentAcknowledgementSection extends StatelessWidget {
  final Function(int, Map<String, dynamic>?) onNavigate;
  final Map<String, dynamic> data;

  const PaymentAcknowledgementSection({
    super.key,
    required this.onNavigate,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('${data.toString()}');
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              Expanded(
                child: Text(
                  "Transfer confirmation",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 48), // To balance the back button spacing
            ],
          ),

          SizedBox(height: 10),
          // Recipient Info
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Bank/Payment logo
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                      Icon(Icons.account_balance_wallet, color: Colors.white),
                ),
                SizedBox(width: 12),
                // User Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'] ?? "Recipient Name",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Wise • ${data['mobile number'] ?? 'XXXXXXXXXX'}",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 12),

          // Transaction Details
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Column(
              children: [
                _transactionDetailRow(
                    "Transfer amount", "₹ ${data['amount'] ?? '0'}"),
                SizedBox(height: 8),
                _transactionDetailRow("Admin fee", "₹ 25"),
                Divider(height: 20, thickness: 1, color: Colors.grey[300]),
                _transactionDetailRow("Total", "₹ ${_calculateTotal()}",
                    isBold: true),
              ],
            ),
          ),

          SizedBox(height: 12),

          // Terms & Conditions
          Row(
            children: [
              Icon(Icons.info_outline, size: 16, color: Colors.black54),
              SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                    children: [
                      TextSpan(text: "By continuing, you agree to the "),
                      TextSpan(
                        text: "Terms & Conditions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Confirm Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                debugPrint("PaymentData:${data}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordScreen(
                      callBack: () {
                        debugPrint('');
                      },
                      navigationType: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => PaymentProcessingBloc(),
                            child: PaymentProcessingScreen(data: data),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                "Confirm",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),

          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _transactionDetailRow(String label, String amount,
      {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  String _calculateTotal() {
    int amount = int.tryParse(data['amount']?.toString() ?? '0') ?? 0;
    return (amount + 25).toString();
  }
}
