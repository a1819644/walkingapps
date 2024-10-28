import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/signup.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Signup(),

    }
)
);