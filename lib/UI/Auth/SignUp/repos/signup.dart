import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wise_wallet/Data/user.dart';

class Signup {
  Future<Map<String, dynamic>> signUp(Map<String, dynamic> user) async {
    final url = Uri.parse("http://192.168.20.234:3000/auth/Signup");

    // Validate input fields
    if (user.values.any((value) => value == null || value.toString().isEmpty)) {
      throw Exception("All fields are required");
    }

    // Validate email format
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(user['email'])) {
      throw Exception("Invalid email format");
    }

    // Validate mobile number format
    final mobileRegex = RegExp(r'^[0-9]{10}$');
    if (!mobileRegex.hasMatch(user['mobile'])) {
      throw Exception("Invalid mobile number. Must be 10 digits.");
    }
    try {
      // Send the POST request
      final response = await http.post(
        url,
        body: jsonEncode(user),
        headers: {'Content-Type': 'application/json'},
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 201) {
        // User successfully registered
        final responseData = jsonDecode(response.body);
        debugPrint("User registered successfully: ${responseData['user']}");
        userSession.loadSession(user);
        return responseData; // Return success response
      } else if (response.statusCode == 400) {
        throw Exception("Bad Request: ${jsonDecode(response.body)['message']}");
      } else if (response.statusCode == 409) {
        throw Exception("Conflict: ${jsonDecode(response.body)['message']}");
      } else {
        throw Exception(
          "Failed to register: ${response.statusCode} ${response.reasonPhrase}",
        );
      }
    } catch (err) {
      throw Exception("Error during sign-up: $err");
    }
  }
}

Signup signUp = Signup();
