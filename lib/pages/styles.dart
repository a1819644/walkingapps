import 'package:flutter/material.dart';

class AppStyles{

  // Text style for the heading texts
  static const TextStyle headingText = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // for the subHeading text
  static const TextStyle subheadingText = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 15.0,
    color: Colors.black54,
    fontWeight: FontWeight.w500,
  );

  // Container Styles
  static BoxDecoration gradientBoxDecoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color(0xFF673AB7), // Replace with your own colors
        Color(0xFF512DA8),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(10),
  );


  // Progress page styling

  // box decoration


}