import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartTesting extends StatefulWidget {
  final double totalAmount;
  final List<Map<String, dynamic>> data;
  const PieChartTesting(
      {super.key, required this.totalAmount, required this.data});

  @override
  State<PieChartTesting> createState() => _PieChartTestingState();
}

class _PieChartTestingState extends State<PieChartTesting> {
  List<PieChartSectionData>? pieData;
  List<Map<String, dynamic>> colors = [
    {"1": Colors.purple}
  ];
  @override
  void initState() {
    widget.data
        .map((Map<String, dynamic> e) =>
            pieData!.add(PieChartSectionData(radius: e["percent"])))
        .toList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pie Chart",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 300, // Chart width
                height: 300, // Chart height
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 80, // Space in the center
                    sections: [
                      PieChartSectionData(
                        color: Colors.purple,
                        radius: 30, // Thinner slices
                      ),
                      PieChartSectionData(
                        color: Colors.blueAccent,
                        radius: 30,
                      ),
                      PieChartSectionData(
                        color: Colors.grey,
                        radius: 30,
                      ),
                      PieChartSectionData(
                        color: Colors.lightBlueAccent,
                        radius: 30,
                      ),
                    ],
                  ),
                ),
              ),
              // Centered Text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total Income:",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5), // Space between the two lines
                  Text(
                    "₹0,00,000",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
