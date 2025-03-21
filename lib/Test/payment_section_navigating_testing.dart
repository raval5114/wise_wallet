// import 'package:flutter/material.dart';
// import 'package:wise_wallet/Data/testingData.dart';

// class PaymentSectionTesting extends StatefulWidget {
//   const PaymentSectionTesting({super.key});

//   @override
//   State<PaymentSectionTesting> createState() => _PaymentSectionTestingState();
// }

// class _PaymentSectionTestingState extends State<PaymentSectionTesting> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Payment Section Testing"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 isScrollControlled: true,
//                 builder: (context) {
//                   return Padding(
//                     padding: EdgeInsets.only(
//                         bottom: MediaQuery.of(context).viewInsets.bottom),
//                     child: StatefulBuilder(
//                       builder: (context, setState) {
//                         return PaymentSectionViaNumber();
//                       },
//                     ),
//                   );
//                 },
//               );
//             },
//             child: Text(
//               "Payment Section",
//               style: TextStyle(color: Colors.white),
//             )),
//       ),
//     );
//   }
// }
