import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _obscureText = true; // Initialize _obscureText to true

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0), // Add padding for better spacing
          child: SingleChildScrollView( // Wrap with SingleChildScrollView to handle overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
              children: [
                const Text(
                  "Log In",
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize:40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Add spacing between widgets
                const Text(
                  "Email",
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15.0,
                    color: Colors.black,

                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF6766F6),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 350,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF5F6FA),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,),
                      ),
                      validator: (value) {
                        return null;
                      
                        // ... your email validation logic ...
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF6766F6),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF5F6FA),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Align( // Align "Forgot password?" to the left
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 15.0,
                      color: Color(0xFF5A32AE),
                      shadows: [
                        Shadow(
                          color: Color(0xFF5A32AE),
                          offset: Offset(1.0, 2.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity, // Make button take fullwidth
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                      backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF5A32AE)),

                      shape: WidgetStateProperty.all<BeveledRectangleBorder>(
                        BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0), // Apply a 20.0 radius

                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20), // Adjust padding
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 2), // Horizontal and vertical shadow offset
                              blurRadius: 4, // Blur radius for the shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                          'OR',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 20,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 2), // Horizontal and vertical shadow offset
                              blurRadius: 4, // Blur radius for the shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.apple, size: 40),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook, size: 40),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.google, size: 30),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Row(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      " Sign Up",
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 15.0,
                        color: Color(0xFF5A32AE),
                        shadows: [
                          Shadow(
                            color: Color(0xFF5A32AE),
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}