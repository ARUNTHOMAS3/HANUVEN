import 'package:flutter/material.dart';
import 'logopage.dart'; // Import LogoPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GradientBackground(), // Start with the LogoPage
    );
  }
}


