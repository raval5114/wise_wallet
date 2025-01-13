import 'package:flutter/material.dart';

class ChartData {
  final String categoryName;
  final Color color;
  final double percent;
  final double amount;

  const ChartData({
    required this.categoryName,
    required this.color,
    required this.percent,
    required this.amount,
  });

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      categoryName: json["categoryName"] as String,
      color: Color(int.parse(json["color"])),
      percent: json["percent"] as double,
      amount: json["amount"] as double,
    );
  }
}

class ChartList {
  final List<ChartData> chartList;

  const ChartList({required this.chartList});

  factory ChartList.fromJson(Map<String, dynamic> json) {
    final List<dynamic> data = json["chartList"] as List<dynamic>;
    return ChartList(
      chartList: data
          .map((item) => ChartData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

ChartList chartList = ChartList.fromJson(json);
final json = {
  "chartList": [
    {
      "categoryName": "Food",
      "color": "0xFFFF5733",
      "percent": 30.0,
      "amount": 5000.0
    },
    {
      "categoryName": "Transport",
      "color": "0xFF33FF57",
      "percent": 20.0,
      "amount": 3000.0
    },
    {
      "categoryName": "Utilities",
      "color": "0xFF3357FF",
      "percent": 10.0,
      "amount": 1500.0
    },
    {
      "categoryName": "Entertainment",
      "color": "0xFFFF33A1",
      "percent": 15.0,
      "amount": 2500.0
    },
    {
      "categoryName": "Health",
      "color": "0xFF33FFD5",
      "percent": 8.0,
      "amount": 1200.0
    },
    {
      "categoryName": "Education",
      "color": "0xFF8E44AD",
      "percent": 12.0,
      "amount": 1800.0
    }
  ]
};
