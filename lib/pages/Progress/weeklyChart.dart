import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Weeklychart extends StatefulWidget {
  @override
  _WeeklychartState createState() => _WeeklychartState();
}

class _WeeklychartState extends State<Weeklychart> {
  // Data for the graph
  final List<FlSpot> spots = [
    const FlSpot(0, 2000), // Sunday
    const FlSpot(1, 1500), // Monday
    const FlSpot(2, 2800), // Tuesday
    const FlSpot(3, 4000), // Wednesday
    const FlSpot(4, 3500), // Thursday
    const FlSpot(5, 3800), // Friday
    const FlSpot(6, 3000), // Saturday
  ];

  // Selected day index
  int? selectedDayIndex;

  @override
  Widget build(BuildContext context) {
    // Days of the week
    const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    return Scaffold(
      body: Column(
        children: [
          // Display selected day's steps
          if (selectedDayIndex != null)
            const Padding(
              padding: EdgeInsets.all(.1),
            ),
          Expanded(
            child: GestureDetector(
              onTapDown: (details) {
                _handleDayTap(details.localPosition);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 0.0),
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false), // Disable grid lines
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1000,
                          getTitlesWidget: (value, meta) {
                            return FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                '${(value.toInt() / 1000).toStringAsFixed(1)}k',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF96A7AF),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            int index = value.toInt();
                            if (index >= 0 && index < days.length) {
                              return GestureDetector(
                                onTap: () => _onDaySelected(index),
                                child: Text(
                                  days[index],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: selectedDayIndex == index
                                        ? Colors.deepPurple // Highlight selected day
                                        : Colors.black,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              );
                            }
                            return const Text('');
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true, // Curved lines
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFB09FFF),
                            Color(0xFF8D79F6),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        barWidth: 5,
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFB09FFF).withOpacity(0.5),
                              const Color(0xFF8D79F6).withOpacity(0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        spots: spots,
                      ),
                    ],
                    maxX: 6, // Saturday
                    minX: 0, // Sunday
                    maxY: 4500, // Max steps
                    minY: 0, // Min steps
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Handle day selection when user taps on a day
  void _onDaySelected(int index) {
    setState(() {
      selectedDayIndex = index;
    });
  }

  // Handle tap position to detect selected day
  void _handleDayTap(Offset position) {
    final dayWidth = MediaQuery.of(context).size.width / 7; // Divide screen width by 7 days
    final tappedDayIndex = (position.dx / dayWidth).floor(); // Calculate day index

    if (tappedDayIndex >= 0 && tappedDayIndex < spots.length) {
      setState(() {
        selectedDayIndex = tappedDayIndex;
      });
    }
  }
}
