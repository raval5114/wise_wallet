import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io'; // For SocketException
import 'dart:async'; // For TimeoutException
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wise_wallet/Data/user.dart';

class Auth {
  // Secure storage instance for storing tokens securely
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<bool> signin(String emailOrMobile, String password) async {
    // Replace with your server's IP or domain
    final url = Uri.parse('http://192.168.31.47:3000/auth/Signin');

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
        // Check for token in the response
        if (responseBody['token'] != null) {
          if (responseBody['user'] != null) {
            userSession.loadSession(responseBody['user']);
            await secureStorage.write(
                key: "emailOrMobile", value: emailOrMobile);
            await secureStorage.write(key: "password", value: password);
            await secureStorage.write(
                key: "token", value: responseBody['token']);
          }

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

  void signOut() async {
    userSession.cleanOutSession();
    await secureStorage.delete(key: "emailOrMobile");
    await secureStorage.delete(key: "password");
  }

  Future<String?> getToken() async {
    try {
      return await secureStorage.read(key: 'authToken');
    } catch (e) {
      throw Exception('Error retrieving token: $e');
    }
  }
}

// Instantiate Auth for use throughout the app
final Auth auth = Auth();
