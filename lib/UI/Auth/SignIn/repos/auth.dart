import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io'; // For SocketException
import 'dart:async'; // For TimeoutException
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_wallet/Data/config.dart';
import 'package:wise_wallet/Data/user.dart';

class Auth {
  final String _domain = DOMAIN_IP;
  SharedPreferences? storage;

  Auth() {
    _initStorage();
  }

  Future<void> _initStorage() async {
    try {
      storage = await SharedPreferences.getInstance();
    } catch (e) {
      debugPrint("Error initializing SharedPreferences: $e");
    }
  }

  Future<bool> signin(String emailOrMobile, String password) async {
    await _initStorage();
    if (storage == null) throw Exception("SharedPreferences not initialized");

    final url = Uri.parse('$_domain:3000/auth/Signin');

    if (emailOrMobile.isEmpty || password.isEmpty) {
      throw Exception('Email/Mobile and Password are required.');
    }

    try {
      final requestBody = jsonEncode({
        'emailOrMobile': emailOrMobile,
        'password': password,
      });

      final response = await http.post(
        url,
        body: requestBody,
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['token'] != null) {
          await storage!.setString("token", responseBody['token']);
          debugPrint("Token: ${responseBody['token']}");
          return true;
        } else {
          throw Exception('Token not found in response.');
        }
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
    await _initStorage();
    if (storage == null) throw Exception("SharedPreferences not initialized");
    final url = Uri.parse("$_domain:3000/auth/dashboard");

    if (token.isEmpty) {
      throw Exception("Token Required");
    }

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('user')) {
          userSession.loadSession(data['user']);
        } else {
          throw Exception("User data not found in response.");
        }
      } else {
        throw Exception("Failed to fetch dashboard: ${response.body}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }

  Future<Map<String, dynamic>> getAccountDetails(String token) async {
    await _initStorage();
    if (storage == null) throw Exception("SharedPreferences not initialized");
    final url = Uri.parse("$_domain:3000/banks/accounts");

    if (token.isEmpty) {
      throw Exception("Token Required");
    }

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to fetch account details: ${response.body}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }

  void signOut() async {
    await _initStorage();
    if (storage != null) {
      await storage!.remove('token');
    }
    userSession.cleanOutSession();
  }
}

final Auth auth = Auth();
