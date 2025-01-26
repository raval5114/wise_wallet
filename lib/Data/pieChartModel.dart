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
      "percent": 50.0,
      "amount": 5000.0
    },
  ]
};
