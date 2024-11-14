import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'hoverEffectDaily.dart';
import 'hoverEffectWeekly.dart';
import 'hoverEffectMonthly.dart';

class WeeklyProgress extends StatefulWidget {
  const WeeklyProgress({super.key});

  @override
  State<WeeklyProgress> createState() => _WeeklyProgressState();
}

class _WeeklyProgressState extends State<WeeklyProgress> {

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
      body: const SafeArea(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HoverEffectDaily(),
                      HoverEffectWeekly(),
                      HoverEffectMonthly(),
                    ],
                  )
                ],
              ),
          )),
    );
  }
}
