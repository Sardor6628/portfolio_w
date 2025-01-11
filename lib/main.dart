import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Styled Text & Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StyledTextScreen(),
    );
  }
}

class StyledTextScreen extends StatelessWidget {
  const StyledTextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Styled Text & Chart"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with styled text
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 24, color: Colors.black),
                children: [
                  const TextSpan(
                    text: "Bringing Your Ideas to Life Through ",
                  ),
                  TextSpan(
                    text: "Software",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: " 👋",
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Highlighted text
            Row(
              children: [
                const Text("Together "),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: const Text(
                    "we can create something remarkable",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Underlined text
            const Text(
              "Design and enhance your software solutions.",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Colors.orange,
                decorationThickness: 2,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            // Custom drawing (highlight + underline)
            CustomPaint(
              size: const Size(double.infinity, 100),
              painter: HighlightPainter(),
            ),
            const SizedBox(height: 24),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action for About Me
                  },
                  child: const Text("About Me"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action for Read CV
                  },
                  child: const Text("Read CV!"),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Bar chart
            const Text(
              "Coding Activity in the Last 7 Days:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 100,
                          color: Colors.red,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 90,
                          color: Colors.blue,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 80,
                          color: Colors.green,
                          width: 15,
                        ),
                      ],
                    ),
                  ],
                  // titlesData: FlTitlesData(
                  //   leftTitles: SideTitles(showTitles: true),
                  //   bottomTitles: SideTitles(showTitles: false),
                  // ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HighlightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final highlightPaint = Paint()
      ..color = Colors.yellow.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final underlinePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2.0;

    // Draw highlight
    canvas.drawRect(const Rect.fromLTWH(0, 20, 200, 30), highlightPaint);

    // Draw underline
    canvas.drawLine(const Offset(0, 80), const Offset(200, 80), underlinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}