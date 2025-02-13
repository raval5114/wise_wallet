import 'package:flutter/material.dart';

class ScannerSection extends StatefulWidget {
  const ScannerSection({super.key});

  @override
  State<ScannerSection> createState() => _ScannerSectionState();
}

class _ScannerSectionState extends State<ScannerSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Here Camera will Open"),
    );
  }
}
