import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:walkingapps/pages/slideMenu.dart';
import 'package:walkingapps/pages/stepTrackerState.dart';
import 'package:walkingapps/pages/styles.dart';
class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  // colors
  static const yellowish = Color(0xFFFBBE07);
  static const greyish = Color(0xFF110000);
  static Color purplishleft = Color(0xFF673AB7);
  static Color purplishRight = Color(0xFF512DA8);

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  // Step tracking variables
  final double currentSteps = 7000; // Example current steps
  final double goalSteps = 10000;   // Example goal steps

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0), // Start from left
      end: Offset.zero,         // End at current position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _showSlideMenu() {
    showDialog(
      context: context,
      builder: (context) {
        _controller.forward(); // Start the animation
        return SlideMenu(
          offsetAnimation: _offsetAnimation,
          controller: _controller,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: _showSlideMenu,
              icon: const Icon(Icons.menu, size: 30),
            ),
            const Text(
              'Feed',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.bell,
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
                children: [
                  Text(
                    'Steps',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              StepTracker(
                currentSteps: currentSteps,
                goalSteps: goalSteps,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Rewards',

                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 165.0,
                        width: MediaQuery.of(context).size.width * 0.42,   // 50% of screen width,
                        decoration: BoxDecoration(
                          color: yellowish.withOpacity(0.3), // Set background color
                          borderRadius: BorderRadius.circular(10), // Set corner radius
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10,),
                            const Text(
                              "10,088.00",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 30.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Total earning",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 15.0,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            const Text(
                              "5,000.00",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 30.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Today's earning",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 15.0,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Covered Distance',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 165.0,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                          color: greyish.withOpacity(0.2), // Set background color
                          borderRadius: BorderRadius.circular(10), // Set corner radius
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25,),
                            IconButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states){
                                      if (states.contains(MaterialState.pressed)){
                                        return greyish.withOpacity(0.1);
                                      }
                                      return Colors.white;
                                    },
                                ),
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.route,
                                color: purplishleft,
                                size: 45  ,
                              ),
                            ),
                            const Text(
                              'Distance',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            const Text(
                              '20 Km',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Walk Activity',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: AppStyles.gradientBoxDecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left Column with Bmp range and values
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Bmp range',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5), // Spacing between texts
                              Text(
                                '60 - 100',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                          // Icon on the right side
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(10.0), // Padding inside the circle
                            child: Icon(
                              Icons.monitor_heart, // Use a heart monitor icon or similar
                              color: purplishRight,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(

            color: Colors.white,

            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
            child: BottomNavigationBar(
                // currentIndex: _selectedIndex,
                // onTap: _onItemTapped,
                selectedItemColor: purplishRight,
                unselectedItemColor: Colors.black,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                items:const [
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.clone),
                    label: 'Feed',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.calendarDays),
                    label: 'My goals',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.chartColumn),
                    label: 'Progress',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.user),
                    label: 'Profile',
                  ),
                ],
            ),
      ),
    );
  }
}

