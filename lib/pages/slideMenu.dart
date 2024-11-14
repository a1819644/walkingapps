import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideMenu extends StatelessWidget {
  final Animation<Offset> offsetAnimation;
  final AnimationController controller;

  const SlideMenu({
    required this.offsetAnimation,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            controller.reverse().then((_) => Navigator.of(context).pop());
          },
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SlideTransition(
          position: offsetAnimation,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Material(
              color: Colors.white,
              child: SizedBox(
                width: 200,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('Option 1'),
                      onTap: () {
                        controller.reverse().then((_) => Navigator.of(context).pop());
                        print('Selected: Option 1');
                      },
                    ),
                    ListTile(
                      title: const Text('Option 2'),
                      onTap: () {
                        controller.reverse().then((_) => Navigator.of(context).pop());
                        print('Selected: Option 2');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}