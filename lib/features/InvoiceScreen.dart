import 'package:flutter/material.dart';

class Invoicescreen extends StatefulWidget {
  const Invoicescreen({super.key});

  @override
  State<Invoicescreen> createState() => _InvoicescreenState();
}

class _InvoicescreenState extends State<Invoicescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Invoice "),
      ),
    );
  }
}