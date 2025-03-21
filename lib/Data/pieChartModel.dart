import 'dart:math';
import 'package:flutter/material.dart';

class ChartData {
  final String categoryName;
  final Color color;
  final double percent;
  final double amount;

  ChartData({
    required this.categoryName,
    required this.color,
    required this.percent,
    required this.amount,
  });

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      categoryName: json["categoryName"] as String,
      color: getRandomColor(), // Automatically assign color
      percent: (json["percent"] as num).toDouble(),
      amount: (json["amount"] as num).toDouble(),
    );
  }
}

// Function to get a random color
Color getRandomColor() {
  final List<Color> colorOptions = [
    Colors.blue,
    Colors.purple,
    Colors.purpleAccent,
    Colors.deepPurple,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.teal,
    Colors.amber,
  ];
  return colorOptions[Random().nextInt(colorOptions.length)];
}

class ChartList {
  final List<ChartData> chartList;

  ChartList({required this.chartList});

  factory ChartList.fromJson(Map<String, dynamic> json) {
    final List<dynamic> data = json["chartList"] as List<dynamic>;
    return ChartList(
      chartList: data
          .map((item) => ChartData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

// Sample JSON data
final json = {
  "chartList": [
    {"categoryName": "Food", "percent": 50.0, "amount": 5000.0},
    {"categoryName": "Entertainment", "percent": 30.0, "amount": 3000.0},
    {"categoryName": "Travel", "percent": 20.0, "amount": 2000.0},
  ]
};

ChartList chartList = ChartList.fromJson(json);
