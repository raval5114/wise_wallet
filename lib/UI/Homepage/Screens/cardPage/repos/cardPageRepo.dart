import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wise_wallet/Data/config.dart';
import 'package:http/http.dart' as http;

class Cardpagerepo {
  final String _domain = DOMAIN_IP;

  // Secure storage instance for storing tokens securely
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  Future<Map<String, dynamic>> getAccountDetails() async {
    String? token = await secureStorage.read(key: "token");
    final url = Uri.parse("$_domain:3000/banks/accounts");

    if (token!.isEmpty) {
      throw Exception("Token Required");
    }

    try {
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        //   debugPrint("Account Details: $data");
        return data;
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
