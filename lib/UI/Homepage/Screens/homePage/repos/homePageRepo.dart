import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_wallet/Data/config.dart';

class HomePageRepo {
  late SharedPreferences storage;
  final Completer<void> _initCompleter = Completer<void>();

  HomePageRepo() {
    _initStorage();
  }

  Future<void> _initStorage() async {
    if (!_initCompleter.isCompleted) {
      try {
        storage = await SharedPreferences.getInstance();
        _startDisposalTimer();
        _initCompleter.complete();
      } catch (e) {
        if (!_initCompleter.isCompleted) {
          _initCompleter.completeError(e);
        }
      }
    }
    return _initCompleter.future;
  }

  void _startDisposalTimer() {
    Timer(Duration(seconds: 30), () {
      _disposeStorage();
    });
  }

  void _disposeStorage() {
    storage.remove('balance');
    print("SharedPreferences cleared after 30 seconds");
  }

  Future<bool> getBalance() async {
    await _initStorage();
    String? token = storage.getString('token');
    if (token == null || token.isEmpty) {
      throw Exception('Invalid or Expired Token');
    }

    Uri url = Uri.parse("$DOMAIN_IP:3000/banks/getBalance");

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        storage.setInt('balance', data['totalBalance']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    await _initStorage();
    String? token = storage.getString('token');

    if (token == null || token.isEmpty) {
      throw Exception('Invalid or Expired Token');
    }

    Uri url = Uri.parse("$DOMAIN_IP:3000/transactions/fetchTransactions");

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> transactions = jsonDecode(response.body);
        debugPrint("${transactions}");
        return List<Map<String, dynamic>>.from(transactions);
      } else {
        throw Exception("Failed to fetch transactions: ${response.body}");
      }
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }
}

final HomePageRepo homePageRepo = HomePageRepo();
