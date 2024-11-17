import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:walkingapps/pages/styles.dart';

class Weeklychart extends StatelessWidget {
  static const purplishTop = Color(0xFFB09FFF);
  @override
  Widget build(BuildContext context) {
    // Days of the week
    const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false), // Disable grid lines
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1000,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.5, 0.0),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            textDirection: TextDirection.values.last,
                            '${value.toInt()/1000}k',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF96A7AF),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1, // Ensures each X-axis value maps correctly
                    getTitlesWidget: (value, meta) {
                      // Map days correctly to X-axis valuesFontWeight.w800,
                      if (value >= 0 && value < days.length) {
                        return Text(
                          days[value.toInt()],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight:  FontWeight.w800,
                          ),
                        );
                      } else {
                        return const Text('');
                      }
                    },
                  ),
                ),
                rightTitles: const AxisTitles(sideTitles: SideTitles(
                  showTitles: false
                )),
                topTitles: const AxisTitles(sideTitles: SideTitles(
                    showTitles: false
                )),
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
                  gradient: AppStyles.gradientBoxDecorationforWeeklyProgressGraph.gradient,
                  barWidth: 5,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient:  LinearGradient(
                  colors: [
                        purplishTop.withOpacity(0.5), // Replace with your own colors
                        Color(0xFF8D79F6).withOpacity(0.1),
                      ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    ),
                  ),
                  spots: const [
                    FlSpot(0, 2000), // Sunday
                    FlSpot(1, 1500), // Monday
                    FlSpot(2, 2800), // Tuesday
                    FlSpot(3, 4000), // Wednesday
                    FlSpot(4, 3500), // Thursday
                    FlSpot(5, 3800), // Friday
                    FlSpot(6, 3000),
                    // Saturday
                  ],
                ),
              ],
              maxX: 6, // Set maximum X value to 6 (Saturday)
              minX: 0, // Set minimum X value to 0 (Sunday)
              maxY: 4500, // Max Y-axis value
              minY: 0, // Min Y-axis value
            ),
          ),
        ),
      ),
    );
  }
}
