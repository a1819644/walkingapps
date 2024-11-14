import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/signup.dart';
import 'pages/feed.dart';
import 'pages/Progress/weeklyProgress.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const WeeklyProgress(),
    }
)
);