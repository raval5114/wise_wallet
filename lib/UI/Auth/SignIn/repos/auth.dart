import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io'; // For SocketException
import 'dart:async'; // For TimeoutException
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wise_wallet/Data/config.dart';
import 'package:wise_wallet/Data/user.dart';

class Auth {
  final String _domain = DOMAIN_IP;
  // Secure storage instance for storing tokens securely
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<bool> signin(String emailOrMobile, String password) async {
    // Replace with your server's IP or domain
    final url = Uri.parse('$_domain:3000/auth/Signin');

    // Input validation
    if (emailOrMobile.isEmpty || password.isEmpty) {
      throw Exception('Email/Mobile and Password are required.');
    }

    try {
      // Preparing the request payload
      final requestBody = jsonEncode({
        'emailOrMobile': emailOrMobile,
        'password': password,
      });

      // Making the POST request with a timeout
      final response = await http.post(
        url,
        body: requestBody,
        headers: {
          'Content-Type': 'application/json', // Header for JSON payloads
        },
      ).timeout(const Duration(seconds: 10));

      // Handle API response
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        // Check for token in the responses
        if (responseBody['token'] != null) {
          await secureStorage.write(key: "token", value: responseBody['token']);

          return true;
        } else {
          throw Exception('Token not found in response.');
        }
      } else if (response.statusCode == 404) {
        throw Exception('Error: User not found.');
      } else if (response.statusCode == 401) {
        throw Exception('Error: Invalid credentials.');
      } else {
        throw Exception(
            'Error: ${response.statusCode}, Response: ${response.body}');
      }
    } on SocketException {
      throw Exception('No Internet connection. Please check your network.');
    } on TimeoutException {
      throw Exception('Request timed out. Please try again.');
    } catch (error) {
      throw Exception('Unexpected error occurred: $error');
    }
  }

  Future<void> getDashBoard(String token) async {
    final url = Uri.parse("$_domain:3000/auth/dashboard");

    if (token.isEmpty) {
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
        debugPrint("Dashboard Data: $data");
        userSession.loadSession(data['user']);
      } else {
        debugPrint("Error: ${response.statusCode}, ${response.body}");
        throw Exception("Failed to fetch dashboard: ${response.body}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }

  Future<Map<String, dynamic>> getAccountDetails(String token) async {
    final url = Uri.parse("$_domain:3000/banks/accounts");

    if (token.isEmpty) {
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
        debugPrint("Account Details: $data");
        return data;
      } else {
        debugPrint("Error: ${response.statusCode}, ${response.body}");
        throw Exception("Failed to fetch account details: ${response.body}");
      }
    } catch (e) {
      print("Network Error: $e");
      throw Exception("Network Error: $e");
    }
  }

  void signOut() async {
    userSession.cleanOutSession();

    await secureStorage.delete(key: "token");
  }
}

// Instantiate Auth for use throughout the app
final Auth auth = Auth();
