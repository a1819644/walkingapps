import 'package:flutter/material.dart';

class AnimatedProgressChart extends StatefulWidget {
  const AnimatedProgressChart({super.key});

  @override
  _AnimatedProgressChartState createState() => _AnimatedProgressChartState();
}

class _AnimatedProgressChartState extends State<AnimatedProgressChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 0.73), // Set target progress (73%)
          duration: const Duration(seconds: 3),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return CustomPaint(
              size: const Size(150, 150), // Size of the chart
              painter: CircularChartPainter(progress: value),
              child: Center(
                child: Text(
                  "${(value * 100).toInt()}%", // Display progress percentage
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CircularChartPainter extends CustomPainter {
  final double progress; // Progress from 0.0 to 1.0

  CircularChartPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 18.0; // Thickness of the chart segments
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2 - strokeWidth / 2;

    // Background Circle
    final Paint bgPaint = Paint()
      ..color = const Color(0xFFEEEEEE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, bgPaint);

    // Purple Progress Arc
    final Paint progressPaint1 = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF8C7EFF),
          Color(0xFFB09FFF),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final double progressAngle1 = 2 * 3.14159265359 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159265359 / 2, // Start angle (-90 degrees)
      progressAngle1, // Sweep angle
      false,
      progressPaint1,
    );

    // Yellow Accent Arc
    final Paint progressPaint2 = Paint()
      ..color = const Color(0xFFF9C74F)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    const double accentStartAngle = 3.14159265359 * 1.5; // 270 degrees
    const double accentSweepAngle = 3.14159265359 / 6; // 30 degrees
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      accentStartAngle,
      accentSweepAngle,
      false,
      progressPaint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
