import 'package:flutter/material.dart';

class Forgotpswd extends StatefulWidget {
  const Forgotpswd({super.key});

  @override
  State<Forgotpswd> createState() => _ForgotpswdState();
}

class _ForgotpswdState extends State<Forgotpswd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Forgot password SCreen",style: TextStyle(
            fontFamily: "Font1"
          ),),
        ),
      ),
    );
  }
}