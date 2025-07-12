// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Purchaseorder extends StatefulWidget {
  const Purchaseorder({super.key});

  @override
  State<Purchaseorder> createState() => _PurchaseorderState();
}

class _PurchaseorderState extends State<Purchaseorder> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Purchase Order"),
      ),
    );
  }
}