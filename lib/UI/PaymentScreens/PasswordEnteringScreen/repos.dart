import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_wallet/Data/config.dart';

class PasswordEnteringScreenRepo {
  /// Retrieves the stored SharedPreferences instance.
  Future<SharedPreferences> _getStorage() async {
    return await SharedPreferences.getInstance();
  }

  /// Sends a PIN to the server for verification.
  Future<bool> checkPin(String pin) async {
    String _domain = await DOMAIN_IP;
    try {
      SharedPreferences storage = await _getStorage();
      String? token = storage.getString('token');

      if (token == null) {
        debugPrint("Authentication token is missing");
        return false;
      }

      // Ensure the domain contains HTTP or HTTPS
      String baseUrl =
          _domain.startsWith("http") ? _domain : "http://$DOMAIN_IP";
      Uri uri = Uri.parse("$baseUrl:3000/banks/verifyPin");

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      Map<String, int> requestBody = {"pin": int.parse(pin)};

      debugPrint("Sending PIN: $pin to $uri");
      debugPrint("Using Token: $token");

      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      debugPrint("Response received: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");

      if (response.statusCode == 200) {
        debugPrint("PIN verification successful");
        return true;
      } else if (response.statusCode == 400) {
        debugPrint("Failed: Pin is required.");
      } else if (response.statusCode == 404) {
        debugPrint("Failed: User not found or PIN not set.");
      } else if (response.statusCode == 401) {
        debugPrint("Failed: Invalid PIN.");
      } else {
        debugPrint(
            "Failed with status: ${response.statusCode}, Response: ${response.body}");
      }

      return false;
    } catch (e) {
      debugPrint("Error verifying PIN: $e");
      return false;
    }
  }
}
