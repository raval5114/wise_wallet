import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:wise_wallet/Data/models/payment.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/PaymentScreens/ScannerPaymentScreen/amountWritingScreen.dart';

class ScannerSection extends StatefulWidget {
  const ScannerSection({super.key});

  @override
  State<ScannerSection> createState() => _ScannerSectionState();
}

class _ScannerSectionState extends State<ScannerSection> {
  String? scannedData;
  bool _hasScanned = false;
  bool _isTorchOn = false;

  final MobileScannerController _cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
    torchEnabled: false,
  );

  void _handleScan(Barcode barcode) {
    if (_hasScanned) return;

    final String? value = barcode.rawValue;
    if (value == null) {
      _showSnackbar("Invalid QR Code");
      return;
    }

    setState(() {
      scannedData = value;
      _hasScanned = true;
    });

    try {
      final Map<String, dynamic> qrDetails = jsonDecode(scannedData!);

      // Validate and extract fromNumber
      final dynamic rawFromNumber = qrDetails['fromNumber'];
      final int? fromNumber = int.tryParse(rawFromNumber.toString());

      if (fromNumber == null) {
        _showSnackbar("Invalid QR Code: 'fromNumber' is not valid");
        return;
      }

      // Assign values to payment object
      payment.fromNumber = int.parse(userSession.mobile!);
      payment.toNumber = fromNumber;

      debugPrint('fromNumber: ${payment.fromNumber}');
      debugPrint('toNumber: ${payment.toNumber}');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Amountwritingscreen()),
      );

      _showSnackbar("Payment Processing...");
    } catch (e) {
      _showSnackbar("Error: Invalid QR Code Format");
    }
  }

  void _showSnackbar(String message) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger != null) {
      messenger.showSnackBar(SnackBar(content: Text(message)));
    }
  }

  void _toggleTorch() {
    _cameraController.toggleTorch();
    setState(() {
      _isTorchOn = !_isTorchOn;
    });
  }

  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanBoxSize = MediaQuery.of(context).size.width * 0.65;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: MobileScanner(
                controller: _cameraController,
                onDetect: (capture) {
                  final Barcode barcode = capture.barcodes.first;
                  _handleScan(barcode);
                },
              ),
            ),

            // Square scanning overlay
            Container(
              width: scanBoxSize,
              height: scanBoxSize,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            // Torch button
            Positioned(
              top: 16,
              right: 16,
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                  icon: Icon(
                    _isTorchOn ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                  ),
                  onPressed: _toggleTorch,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        if (scannedData != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Scanned: $scannedData",
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        if (_hasScanned)
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text("Scan Again"),
              onPressed: () {
                setState(() {
                  scannedData = null;
                  _hasScanned = false;
                });
              },
            ),
          ),
      ],
    );
  }
}
