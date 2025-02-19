import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// class PieChartTesting extends StatefulWidget {
//   const PieChartTesting({
//     super.key,
//   });

//   @override
//   State<PieChartTesting> createState() => _PieChartTestingState();
// }

// class _PieChartTestingState extends State<PieChartTesting> {
//   late List<PieChartSectionData> data;
//   @override
//   void initState() {
//     data = chartList.chartList
//         .map((ChartData e) =>
//             PieChartSectionData(color: e.color, radius: e.percent))
//         .toList();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Pie Chart",
//           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           WiseWalletPieChart(
//               chartType: "Income",
//               chartData: json['chartList'] ?? [],
//               amount: 150000),
//           SizedBox(
//             height: 10,
//           ),
//           ChartItemBreakdown(chartName: "Income", items: [
//             {"name": "Salary", "amount": 120000.50, "color": Colors.purple},
//             {
//               "name": "Freelancing",
//               "amount": 35000.00,
//               "color": Colors.deepPurpleAccent
//             },
//             {
//               "name": "Investments",
//               "amount": 15000.00,
//               "color": Colors.blueAccent
//             },
//             {"name": "Other", "amount": 5000.00, "color": Colors.grey}
//           ])
//         ],
//       ),
//     );
//   }
// }

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
  @override
  Widget build(BuildContext context) {
    final double chartSize = 280.0; // Fixed chart size for simplicity

    // Create the chart data
    final List<PieChartSectionData> pieChartData = widget.chartData.map((e) {
      return PieChartSectionData(
        color: Color(int.parse(e['color'])),
        value: e['percentage'],
        radius: 15,
        titleStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();

    return Container(
      margin: EdgeInsets.all(10),
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
                    ..shader = LinearGradient(
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
                      offset: Offset(2, 2),
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

class ChartItemBreakdown extends StatefulWidget {
  final String chartName;
  final List<Map<String, dynamic>> items;

  const ChartItemBreakdown({
    super.key,
    required this.chartName,
    required this.items,
  });

  @override
  State<ChartItemBreakdown> createState() => _ChartItemBreakdownState();
}

class _ChartItemBreakdownState extends State<ChartItemBreakdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title of the breakdown
          Text(
            "${widget.chartName} Breakdown",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Dynamic List of Items
          widget.items.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    final item = widget.items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        leading: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: item['color'] ?? Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: Text(
                          item['name'] ?? 'Unknown',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Text(
                          "₹${item['amount']?.toStringAsFixed(2) ?? '0.00'}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    "No data available.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
