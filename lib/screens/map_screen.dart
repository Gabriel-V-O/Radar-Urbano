import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFE0E0E0),
            child: CustomPaint(
              size: Size.infinite,
              painter: FullMapPainter(),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar ocorrências na região...',
                  prefixIcon: Icon(Icons.search, color: Color(0xFF78909C)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 250,
            left: 120,
            child: Icon(Icons.location_on, color: Color(0xFFE91E63), size: 40),
          ),
          const Positioned(
            top: 400,
            right: 100,
            child: Icon(Icons.location_on, color: Colors.amber, size: 40),
          ),
          const Positioned(
            top: 180,
            right: 150,
            child: Icon(Icons.location_on, color: Colors.blue, size: 40),
          ),
        ],
      ),
    );
  }
}

class FullMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = const Color(0xFFB0BEC5)
      ..strokeWidth = 3;

    for (double i = 0; i < size.height; i += 120) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paintLine);
    }
    for (double i = 0; i < size.width; i += 120) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paintLine);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
