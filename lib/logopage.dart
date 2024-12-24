import 'package:flutter/material.dart';
import 'create account and signup.dart'; // Import HomePage

class GradientBackground extends StatefulWidget {
  const GradientBackground({super.key});

  @override
  _GradientBackgroundState createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends State<GradientBackground> {
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds before navigating to the HomePage
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF5F5F5), // Light top color
              Color(0xFFD8C2C9), // Pinkish bottom color
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image above the text
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'images/file.png', // Corrected path
                    height: MediaQuery.of(context).size.height * 0.2, // 30% of screen height
                    fit: BoxFit.contain, // Scale image
                  ),
                ),
                const SizedBox(height: 10), // Space between image and text
                const Text(
                  'Hanuven',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
