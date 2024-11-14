import 'package:flutter/material.dart';

class StepTracker extends StatefulWidget {
  final double currentSteps;
  final double goalSteps;

  const StepTracker({
    required this.currentSteps,
    required this.goalSteps,
    Key? key,
  }) : super(key: key);

  @override
  _StepTrackerState createState() => _StepTrackerState();
}

class _StepTrackerState extends State<StepTracker> with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;
  static const purplish = Color(0xFF5A32AE);

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: widget.currentSteps / widget.goalSteps,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    ));

    _progressController.forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        double progress = _progressAnimation.value;

        return Stack(
          alignment: Alignment.center,
          children: [
            // Circular progress indicator
            SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 12,
                backgroundColor: Colors.grey[300],
                color: purplish,
              ),
            ),

            // Text to show steps
            Text(
              'Steps\n${widget.currentSteps.toInt()} / ${widget.goalSteps.toInt()}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            // Arrow indicator
            const Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.arrow_drop_down, // Arrow icon
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
