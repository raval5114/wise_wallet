import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:wise_wallet/Data/config.dart';

class StatePageRepo {
  static const String _baseUrl =
      "http://$DOMAIN_IP:3000/insights"; // Using HTTP for local testing

  static Future<Map<String, dynamic>> getExpense(String token) async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/getExpenseByCategory"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("API Error: ${response.statusCode} - ${response.body}");
        return {"error": "Failed to fetch expenses"};
      }
    } on SocketException {
      print("Network Error: No Internet Connection");
      return {"error": "No Internet Connection"};
    } on FormatException {
      print("Response Format Error");
      return {"error": "Invalid response format"};
    } catch (e) {
      print("Unknown Error: $e");
      return {"error": "Something went wrong"};
    }
  }

  static Future<Map<String, dynamic>> getIncome(String token) async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/getIncomeByCategory"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            "Failed to fetch income: ${response.statusCode} ${response.body}");
      }
    } catch (e) {
      print("Error in getIncome: $e");
      throw Exception("Network error while fetching income");
    }
  }
}
