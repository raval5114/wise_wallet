import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wise_wallet/Data/user.dart';

class GenerateScanner extends StatefulWidget {
  final int fromNumber;

  const GenerateScanner({
    super.key,
    required this.fromNumber,
  });

  @override
  State<GenerateScanner> createState() => _GenerateScannerState();
}

class _GenerateScannerState extends State<GenerateScanner> {
  @override
  Widget build(BuildContext context) {
    final String qrData = '{"fromNumber": "${userSession.mobile}"}';

    return Center(
      child: Container(
        height: 250,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: QrImageView(
          data: qrData,
          version: QrVersions.auto,
          size: 200,
          gapless: false,
        ),
      ),
    );
  }
}
