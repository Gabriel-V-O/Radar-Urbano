import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RadarUrbanoApp());
}

class RadarUrbanoApp extends StatelessWidget {
  const RadarUrbanoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar Urbano',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF2F4F7),
        fontFamily: 'Segoe UI',
      ),
      home: const HomeScreen(),
    );
  }
}
