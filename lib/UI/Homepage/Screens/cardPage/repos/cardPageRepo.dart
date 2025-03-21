import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_wallet/Data/config.dart';
import 'package:http/http.dart' as http;

class Cardpagerepo {
  // final String _domain = DOMAIN_IP as String;
  late String _domain;
  Future<Map<String, dynamic>> getAccountDetails() async {
    _domain = await DOMAIN_IP;
    final SharedPreferences secureStorage =
        await SharedPreferences.getInstance();
    String? token = secureStorage.getString("token");

    if (token == null || token.isEmpty) {
      throw Exception("Token Required");
    }

    final url = Uri.parse("$_domain:3000/banks/accounts");

    try {
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint("Error: ${response.statusCode}, ${response.body}");
        throw Exception("Failed to fetch account details: ${response.body}");
      }
    } catch (e) {
      debugPrint("Network Error: $e");
      throw Exception("Network Error: $e");
    }
  }
}

Cardpagerepo cardpagerepo = Cardpagerepo();
