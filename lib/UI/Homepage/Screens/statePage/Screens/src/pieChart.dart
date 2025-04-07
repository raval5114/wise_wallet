import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class WiseWalletPieChart extends StatefulWidget {
  final String chartType;
  final List<Map<String, dynamic>> chartData;
  final double amount;

  const WiseWalletPieChart({
    super.key,
    required this.chartType,
    required this.chartData,
    required this.amount,
  });

  @override
  State<WiseWalletPieChart> createState() => _WiseWalletPieChartState();
}

class _WiseWalletPieChartState extends State<WiseWalletPieChart> {
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
    Colors.pink,
    Colors.cyan,
    Colors.brown,
  ];

  // Function to get a random color
  Color getRandomColor(int index) {
    return colorOptions[index % colorOptions.length]; // Ensures uniqueness
  }

  @override
  Widget build(BuildContext context) {
    final double chartSize = 280.0; // Fixed chart size for simplicity

    // Create the chart data
    final List<PieChartSectionData> pieChartData =
        widget.chartData.asMap().entries.map((entry) {
      int index = entry.key;
      var e = entry.value;
      return PieChartSectionData(
        color: getRandomColor(index), // Assigns a random color

        radius: 15,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();

    return Container(
      margin: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: chartSize,
            height: chartSize,
            child: PieChart(
              PieChartData(
                centerSpaceRadius:
                    chartSize * 0.3, // Increase hollow center size
                sections: pieChartData,
                sectionsSpace: 1, // Space between sections
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    if (event.isInterestedForInteractions &&
                        pieTouchResponse != null &&
                        pieTouchResponse.touchedSection != null) {
                      setState(() {
                        // Optional: Highlight touched section
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          // Centered Text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Total ${widget.chartType}:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ).createShader(Rect.fromLTWH(0, 0, chartSize, chartSize)),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "₹${widget.amount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
