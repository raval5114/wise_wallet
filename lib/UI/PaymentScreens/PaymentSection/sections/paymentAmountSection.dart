import 'package:flutter/material.dart';

class PaymentAmountSection extends StatefulWidget {
  final Function(int, Map<String, dynamic>?) onNavigate;
  final Map<String, dynamic> data;

  const PaymentAmountSection({
    super.key,
    required this.onNavigate,
    required this.data,
  });

  @override
  State<PaymentAmountSection> createState() => _PaymentAmountSectionState();
}

class _PaymentAmountSectionState extends State<PaymentAmountSection> {
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    debugPrint(widget.data.toString());
    amountController = TextEditingController();
  }

  Widget numberButton(
      {required String number, required Function() onTap, Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        width: 65,
        height: 65,
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: color == Colors.red || color == Colors.green
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget keypad() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          for (var row in [
            ["1", "2", "3"],
            ["4", "5", "6"],
            ["7", "8", "9"],
            ["C", "0", "✔"]
          ])
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: row.map((num) {
                return numberButton(
                  number: num,
                  onTap: () {
                    setState(() {
                      if (num == "C") {
                        amountController.text = "";
                      } else if (num == "✔") {
                        widget.onNavigate(3, {
                          "name": widget.data['accountHolderName'],
                          "mobile number": widget.data['mobile number'],
                          "selected bank": widget.data['selected bank'],
                          "account number": widget.data['account number'],
                          "ifsc code": widget.data['ifsc code'],
                          "balance": widget.data['balance'],
                          "amount": amountController.text
                        });
                      } else {
                        if (amountController.text.length < 7) {
                          amountController.text += num;
                        }
                      }
                    });
                  },
                  color: num == "✔"
                      ? Colors.green
                      : num == "C"
                          ? Colors.red
                          : null,
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Colors.grey[200],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 12),
            Text(
              "Enter Amount",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              width: 180,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "₹ ${amountController.text}",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Your Balance: ₹${widget.data['balance']}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 18),
            keypad(),
            SizedBox(
                height: MediaQuery.of(context)
                    .viewInsets
                    .bottom), // Fix for overflow
          ],
        ),
      ),
    );
  }
}
