import 'package:flutter/material.dart';

class OrganizationRegistration extends StatelessWidget {
  const OrganizationRegistration({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Column(
        children: [
          const GradientHeader(),

          // Example placeholder for remaining content
          Expanded(
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: const Text(
                "Your content goes here...",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientHeader extends StatelessWidget {
  const GradientHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Gradient background with curved bottom
        Container(
          height: screenHeight * 0.23,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFB18CFF),
                Color(0xFF7A63FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),

        // Header content
        Positioned(
          top: screenHeight * 0.06,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Statistics",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Font1', // Optional
                ),
              ),
              const SizedBox(height: 20),

              // Date dropdown-style container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.calendar_today_outlined, size: 18, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      "Weekly, 22 – 28 May",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Font1',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black),
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
