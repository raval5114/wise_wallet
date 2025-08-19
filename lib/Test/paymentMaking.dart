import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/Data/models/payment.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentProccesingScreen/bloc/payment_processing_bloc.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentProccesingScreen/repos/PaymentProcess.dart';

class PaymentProcessingScreen extends StatelessWidget {
  const PaymentProcessingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: BlocProvider(
          create: (context) => PaymentProcessingBloc(),
          child: PaymentmakingComponent(),
        ),
      ),
    );
  }
}

class PaymentmakingComponent extends StatefulWidget {
  const PaymentmakingComponent({super.key});

  @override
  State<PaymentmakingComponent> createState() => _PaymentmakingComponentState();
}

class _PaymentmakingComponentState extends State<PaymentmakingComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    payment.fromNumber = 9033360826;
    payment.toNumber = 9033360826;
    payment.amount = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        debugPrint("Payment Section"),
        debugPrint("From Number:${payment.fromNumber}"),
        debugPrint("To Number:${payment.toNumber}"),
        debugPrint("Amount:${payment.amount}"),
        PaymentProcessService.payViaNumber(
            fromNumber: payment.fromNumber,
            toNumber: payment.toNumber,
            amount: payment.amount)
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
      ),
      child: const Text(
        "Payment Section",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

// class PaymentProcessingScreenComponent extends StatefulWidget {
//   const PaymentProcessingScreenComponent({super.key});

//   @override
//   _PaymentProcessingScreenComponentState createState() =>
//       _PaymentProcessingScreenComponentState();
// }

// class _PaymentProcessingScreenComponentState
//     extends State<PaymentProcessingScreenComponent> {
//   final TextEditingController fromNumberController = TextEditingController();
//   final TextEditingController toNumberController = TextEditingController();
//   final TextEditingController amountController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PaymentProcessingBloc, PaymentProcessingState>(
//       listenWhen: (previous, current) => current is PaymentProcessActionstate,
//       buildWhen: (previous, current) => current is! PaymentProcessActionstate,
//       listener: (context, state) {
//         if (state is PaymentProcessErrorState) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//                 content: Text(state.errorMessage), backgroundColor: Colors.red),
//           );
//         }
//       },
//       builder: (context, state) {
//         if (state is PaymentProcessLoadingstate) {
//           return PaymentProcessingComponent();
//         } else if (state is PaymentProcessSuccessState) {
//           return PaymentProcessingSuccessfulComponent(data: state.data);
//         }
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: fromNumberController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: "From Number"),
//               ),
//               TextField(
//                 controller: toNumberController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: "To Number"),
//               ),
//               TextField(
//                 controller: amountController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: "Amount"),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   final String fromNumber = fromNumberController.text.trim();
//                   final String toNumber = toNumberController.text.trim();
//                   final String amount = amountController.text.trim();

//                   if (fromNumber.isEmpty ||
//                       toNumber.isEmpty ||
//                       amount.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                           content: Text("Please fill all fields"),
//                           backgroundColor: Colors.orange),
//                     );
//                     return;
//                   }

//                   context.read<PaymentProcessingBloc>().add(
//                         PaymentProcessingEvent(
//                           data: {
//                             "fromNumber": fromNumber,
//                             "toNumber": toNumber,
//                             "amount": double.tryParse(amount) ?? 0.0,
//                           },
//                         ),
//                       );
//                 },
//                 child: const Text("Retry"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
