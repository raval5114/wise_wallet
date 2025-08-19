import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/Data/models/payment.dart';
import 'package:wise_wallet/UI/PaymentScreens/ScannerPaymentScreen/bloc/scanning_payment_bloc.dart';
import 'package:wise_wallet/UI/PaymentScreens/ScannerPaymentScreen/paymentSuccessfullScreen.dart';

class Amountwritingscreen extends StatelessWidget {
  const Amountwritingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Amount'),
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => ScanningPaymentBloc(),
        child: const AmountwritingscreenComponent(),
      ),
    );
  }
}

class AmountwritingscreenComponent extends StatefulWidget {
  const AmountwritingscreenComponent({super.key});

  @override
  State<AmountwritingscreenComponent> createState() =>
      _AmountwritingscreenComponentState();
}

class _AmountwritingscreenComponentState
    extends State<AmountwritingscreenComponent> {
  final TextEditingController _amountController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanningPaymentBloc, ScanningPaymentState>(
      listenWhen: (previous, current) => current is ScanningPaymentActionState,
      buildWhen: (previous, current) => current is! ScanningPaymentActionState,
      listener: (BuildContext context, ScanningPaymentState state) {
        if (state is ScanningPaymentLoading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is ScanningPaymentSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentsuccessfullScreen(),
            ),
          );
        }
        if (state is ScanningPaymentError) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              "Enter Amount",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        final amountText = _amountController.text;
                        if (amountText.isEmpty ||
                            double.tryParse(amountText) == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter a valid amount"),
                            ),
                          );
                          return;
                        }

                        setState(() {
                          isLoading = true;
                        });

                        double amount = double.parse(amountText);
                        debugPrint(
                            "Proceeding to payment screen with amount: $amount");

                        // Simulate processing or dispatch your event here

                        payment.amount = double.parse(amountText);
                        context
                            .read<ScanningPaymentBloc>()
                            .add(ScanningEvent());
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                    : const Text(
                        'Proceed to Payment',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
