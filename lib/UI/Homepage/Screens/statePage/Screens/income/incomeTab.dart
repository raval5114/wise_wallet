import 'package:flutter/material.dart';

class IncomeTab extends StatefulWidget {
  const IncomeTab({super.key});

  @override
  State<IncomeTab> createState() => _IncomeTabState();
}

class _IncomeTabState extends State<IncomeTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
              child: Center(
                child: Text("Hello"),
              ),
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
            ),
          ],
        ),
      ),
    );
  }
}
