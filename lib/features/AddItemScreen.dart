import 'package:flutter/material.dart';

class Additemscreen extends StatefulWidget {
  const Additemscreen({super.key});

  @override
  State<Additemscreen> createState() => _AdditemscreenState();
}

class _AdditemscreenState extends State<Additemscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Add Items"),
      ),
    );
  }
}