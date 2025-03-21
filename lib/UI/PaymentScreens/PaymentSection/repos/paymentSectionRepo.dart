import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wise_wallet/Data/config.dart';

class PaymentSectionRepo {
  static Future<List<Map<String, dynamic>>> getContactInfo(
      String number) async {
    final url = "$DOMAIN_IP:3000/banks/getAccountsByNumber";
    Map<String, dynamic> requrestBody = {"number": int.parse(number)};
    try {
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(requrestBody));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(jsonResponse['data']);
      } else {
        throw Exception("API Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception("Payment Section Repo Error:${e.toString()}");
    }
  }
}
