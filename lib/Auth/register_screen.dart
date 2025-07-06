import 'package:flutter/material.dart';
 
import 'package:stockwise/widgets/gradient_header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F1FE),
      body: Column(
        children: const [
          GradientHeader(
            title: 'Register Organization',
            subText: 'Let’s get your business started',
          ),

          // Placeholder for your future form or widgets
        ],
      ),
    );
  }
}
