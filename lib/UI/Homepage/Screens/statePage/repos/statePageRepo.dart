import 'dart:convert';
import 'package:http/http.dart' as http;

class StatePageRepo {
  static const String _baseUrl =
      "https://your-api-url.com/insights"; // Replace with your actual API URL

  static Future<Map<String, dynamic>> getExpense(String token) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/getExpense"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch expenses");
    }
  }

  static Future<Map<String, dynamic>> getIncome(String token) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/getIncome"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch income");
    }
  }
}
