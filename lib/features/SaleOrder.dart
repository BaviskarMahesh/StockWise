// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Saleorder extends StatefulWidget {
  const Saleorder({super.key});

  @override
  State<Saleorder> createState() => _SaleorderState();
}

class _SaleorderState extends State<Saleorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Sales of order"),
      ),
    );
  }
}