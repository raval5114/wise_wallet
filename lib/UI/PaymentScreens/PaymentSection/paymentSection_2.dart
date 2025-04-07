import 'package:flutter/material.dart';

class Paymentsection2 extends StatefulWidget {
  final Widget child;
  const Paymentsection2({super.key, required this.child});

  @override
  State<Paymentsection2> createState() => _Paymentsection2State();
}

class _Paymentsection2State extends State<Paymentsection2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget.child,
    );
  }
}
