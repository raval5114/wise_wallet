import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_wallet/Data/config.dart';

class HomePageRepo {
  late final SharedPreferences storage;
  Future<bool> getBalance() async {
    storage = await SharedPreferences.getInstance();
    String? token = storage.getString('token');
    if (token!.isEmpty) {
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
}

final HomePageRepo homePageRepo = HomePageRepo();
