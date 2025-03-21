import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wise_wallet/Data/config.dart';

class PaymentProcessService {
  /// Handles payment via mobile number
  static Future<Map<String, dynamic>> payViaNumber({
    required String fromNumber,
    required String toNumber,
    required double amount,
  }) async {
    try {
      final uri = Uri.parse("$DOMAIN_IP:3000/payment/payViaNumber");
      final response = await http.patch(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "fromNumber": int.tryParse(fromNumber) ?? 0, // Safe parsing
          "toNumber": int.tryParse(toNumber) ?? 0,
          "amount": amount, // Ensure this is a double
        }),
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception("Payment via Number Failed: $e");
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
