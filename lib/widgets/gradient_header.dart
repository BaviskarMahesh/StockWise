import 'package:flutter/material.dart';

class GradientHeader extends StatelessWidget {
  final String title;
  final String subText;

  const GradientHeader({
    super.key,
    required this.title,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: screenHeight * 0.25,
            width: screenWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff7871F8),
                  Color.fromARGB(255, 196, 151, 232),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.06,
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: screenHeight * 0.026,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Font1',
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                subText,
                style: TextStyle(
                  fontSize: screenHeight*0.016,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Font1',
                ),

              )
            ],
          ),
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left
    path.lineTo(0, size.height * 0.75);

    // Smooth curve that flattens gradually toward the right
    path.cubicTo(
      size.width * 0.25, size.height,     // First control point (higher)
      size.width * 0.55, size.height * 0.6, // Second control point (start flattening)
      size.width, size.height * 0.7,      // End point (more flat)
    );

    // Complete the shape
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
