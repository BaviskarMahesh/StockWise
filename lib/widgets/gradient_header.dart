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
                  Color(0xFFD6A5FD),
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
                  fontSize: screenHeight * 0.027,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Font1',
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.015,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenHeight * 0.015),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today_outlined,
                        size: screenHeight * 0.022, color: Colors.black),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      subText,
                      style: TextStyle(
                        fontSize: screenHeight * 0.017,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Font1',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Icon(Icons.keyboard_arrow_down,
                        size: screenHeight * 0.022, color: Colors.black),
                  ],
                ),
              ),
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
    Path path = Path();

    path.lineTo(0, size.height - size.height * 0.12);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - size.height * 0.06,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - size.height * 0.12,
      size.width,
      size.height - size.height * 0.04,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
