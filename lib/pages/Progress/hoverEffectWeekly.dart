import 'package:flutter/material.dart';

class HoverEffectDaily extends StatefulWidget {
  const HoverEffectDaily({super.key});

  static const String textName = "Weekly";

  @override
  State<HoverEffectDaily> createState() => _HoverEffectDailyState();
}

class _HoverEffectDailyState extends State<HoverEffectDaily> {
  bool _isTapped = true;
  static const greysish = Color(0xFFEFEFEF);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200), // Smooth transition
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _isTapped ? const Color(0xFF5D34B0) : Colors.white,
          border: Border.all(
            color: const Color(0x00ffffff) , // Border color based on isTapped state
            width: 0.1, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2) , // Shadow color
              spreadRadius: 0, // Spread radius
              blurRadius: 0.5, // Blur radius
              offset: Offset(0, 1), // Offset in x and y direction
            ),
          ],
          // Set corner radius
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Weekly",
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 15.0,
                color: _isTapped ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
