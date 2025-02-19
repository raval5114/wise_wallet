import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:wise_wallet/Data/config.dart';

class PasswordEnteringScreenRepo {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  Future<bool> checkPin(String pin) async {
    try {
      String? token = await storage.read(key: 'token');
      if (token == null) {
        throw Exception("Authentication token is missing");
      }

      Uri uri = Uri.parse("$DOMAIN_IP:3000/banks/verifyPin");
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      Map<String, String> requestBody = {"pin": pin};

      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse['success'] ?? false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
