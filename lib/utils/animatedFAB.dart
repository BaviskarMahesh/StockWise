// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:stockwise/routes/app_routes.dart';

class AnimatedGradientFAB extends StatefulWidget {
  const AnimatedGradientFAB({super.key});

  @override
  State<AnimatedGradientFAB> createState() => _AnimatedGradientFABState();
}

class _AnimatedGradientFABState extends State<AnimatedGradientFAB>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: const [Color(0xff7871F8), Color(0xffD6A5FD)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              transform: GradientRotation(_controller.value * 2 * 3.14),
            ).createShader(bounds);
          },
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.barcodeScanner);
            },
            shape: const CircleBorder(),
            backgroundColor: Colors.white, // base color under gradient
            child: const Icon(Icons.qr_code_scanner, color: Colors.black),
          ),
        );
      },
    );
  }
}
