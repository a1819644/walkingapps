import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:walkingapps/pages/Progress/animatedProgressChart.dart';
import 'package:walkingapps/pages/Progress/weeklyChart.dart';
import 'package:walkingapps/pages/styles.dart';
import 'hoverEffectDaily.dart';
import 'hoverEffectWeekly.dart';
import 'hoverEffectMonthly.dart';


class WeeklyProgress extends StatefulWidget {
  const WeeklyProgress({super.key});

  @override
  State<WeeklyProgress> createState() => _WeeklyProgressState();
}

class _WeeklyProgressState extends State<WeeklyProgress> {
  List<FlSpot> chartData = [
    FlSpot(0, 2), // Points (X, Y)
    FlSpot(1, 1.5),
    FlSpot(2, 2.8),
    FlSpot(3, 4),
    FlSpot(4, 3.5),
    FlSpot(5, 3.8),
    FlSpot(6, 3),
    FlSpot(7, 5),
  ];
  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 1:
          text = 'Mon';
          break;
        case 2:
          text = 'Tue';
          break;
        case 3:
          text = 'Wed';
          break;
        case 4:
          text = 'Thur';
          break;
        case 5:
          text = 'Fri';
          break;
        case 6:
          text = 'Sat';
          break;
        case 7:
          text = 'Sun';
          break;
      }
      return Text(text);
    },
  );
  SideTitles get _leftTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      getTitles: (value) {
        const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        return days[value.toInt() % days.length];
      };
      switch (value.toInt()) {
        case 1:
          text = '0';
          break;
        case 2:
          text = '2';
          break;
        case 3:
          text = '4';
          break;
        case 4:
          text = '6';
          break;
        case 5:
          text = '8';
          break;
        case 6:
          text = '10';
          break;
        case 7:
          text = '12';
          break;
      }
      return Text(text);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.arrow_back, size: 30),
            ),
            const Text(
              'Progress',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                Icons.share_outlined,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HoverEffectDaily(),
                      HoverEffectWeekly(),
                      HoverEffectMonthly(),
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "10K",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Steps",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 250,
                        child: Weeklychart(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: AppStyles.gradientBoxDecoration.gradient,
                            border: Border.all(
                              color: const Color(0x00ffffff) , // Border color based on isTapped state
                              width: 0.1, // Border width
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2) , // Shadow color
                                spreadRadius: 0, // Spread radius
                                blurRadius: 0.5, // Blur radius
                                offset: const Offset(0, 1), // Offset in x and y direction
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 10.0),
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Total Steps',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                      Text(
                                        '10,000',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                width: 100.0,

                                child: const AnimatedProgressChart(),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
          )),
    );
  }
}
