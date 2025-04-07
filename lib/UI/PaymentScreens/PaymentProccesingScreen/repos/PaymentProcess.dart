import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wise_wallet/Data/config.dart';

class PaymentProcessService {
  /// Handles payment via mobile number
  static Future<void> payViaNumber({
    required int fromNumber,
    required int toNumber,
    required double amount,
  }) async {
    try {
      final uri = Uri.parse("http://$DOMAIN_IP:3000/payment/payViaNumber");

      final Map<String, dynamic> body = {
        "fromNumber": fromNumber, // Ensure it's a number
        "toNumber": toNumber,
        "amount": amount.toDouble(), // Ensure it's a double
      };

      debugPrint("Sending Request to: $uri");
      debugPrint("Request Body: ${jsonEncode(body)}");

      final response = await http.patch(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(body),
      );

      debugPrint("Response: ${response.body}");

      if (response.statusCode == 200) {
        debugPrint("Payment Successful!");
      } else {
        throw Exception("Failed: ${response.body}");
      }
    } catch (e) {
      debugPrint("Payment Error: $e");
    }
  }

  static Future<bool> payViaSpecificBank({
    required int fromNumber,
    required int toNumber,
    required String fromBank,
    required String toBank,
    required double amount,
  }) async {
    try {
      final uri = Uri.parse("$DOMAIN_IP:3000/payment/payViaSpecificBank");

      final Map<String, dynamic> body = {
        "fromNumber": fromNumber,
        "toNumber": toNumber,
        "fromBank": fromBank,
        "toBank": toBank,
        "amount": amount,
      };

      debugPrint("Sending Request to: $uri");
      debugPrint("Request Body: ${jsonEncode(body)}");

      final response = await http.patch(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(body),
      );

      debugPrint("Response: ${response.body}");

      if (response.statusCode == 200) {
        debugPrint("Payment via Specific Bank Successful!");
        return true;
      } else {
        debugPrint("Failed: ${response.body}");
        return false;
      }
    } catch (e) {
      debugPrint("Payment via Specific Bank Error: $e");
      return false;
    }
  }

  /// Handles payment via card
  static Future<Map<String, dynamic>> payViaCard({
    required String fromAccountNumber,
    required String toAccountNumber,
    required double amount,
  }) async {
    try {
      final uri = Uri.parse("http://$DOMAIN_IP:3000/payment/payViaCard");
      final response = await http.patch(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "fromAccountNumber": fromAccountNumber,
          "toAccountNumber": toAccountNumber,
          "amount": amount,
        }),
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception("Payment via Card Failed: $e");
    }
  }

  /// Handles API response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        final errorResponse = jsonDecode(response.body);
        throw Exception(
            "Error ${response.statusCode}: ${errorResponse["message"] ?? "Payment Failed"}");
      }
    } catch (e) {
      throw Exception(
          "Invalid Response (${response.statusCode}): ${response.body}");
    }
  }
}
