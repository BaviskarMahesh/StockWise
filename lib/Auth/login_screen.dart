import 'package:flutter/material.dart';
import 'package:stockwise/utils/textfield.dart';
import 'package:stockwise/utils/elevatedButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool passWordVisible = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF2F1FE),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.22),

              // Title
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.015),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Font1',
                      fontSize: screenHeight * 0.036, // ~30
                    ),
                    children: const [
                      TextSpan(
                        text: 'Welcome back to ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'StockWise',
                        style: TextStyle(
                          color: Color(0xff7871F8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.005),

              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.015),
                child: Text(
                  "Login to your account",
                  style: TextStyle(
                    fontFamily: 'Font1',
                    color: const Color(0xff969292),
                    fontSize: screenHeight * 0.021,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.07),

              // Email TextField
              TextfieldUtil.customTextField(
                context: context,
                controller: email,
                hintText: "Enter your Email address",
                prefixIcon: Icons.email_outlined,
                prefixIconColor: const Color(0xff969292),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Password TextField
              TextfieldUtil.customTextField(
                context: context,
                controller: password,
                hintText: "Enter your Password",
                prefixIcon: Icons.lock,
                obscureText: passWordVisible,
                suffixIcon: passWordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                onSuffixIconPressed: () {
                  setState(() {
                    passWordVisible = !passWordVisible;
                  });
                },
              ),

            Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.008,
                  left: screenWidth * 0.015,
                  right: screenWidth * 0.01,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      // TODO: Add navigation to forgot password
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontFamily: 'Font1',
                        fontSize: screenHeight * 0.017,
                        color: const Color(0xff7871F8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: screenHeight*0.02,),
              // Sign In Button
              ButtonUtil.customElevatedButton(
  context: context,
  buttonColor: const Color(0xff7871F8),
  text: "Sign In",
  buttonSize: Size(screenWidth * 0.88, screenHeight * 0.065),
  textStyle: TextStyle(
    color: const Color(0xffF2F1FE),
    fontFamily: 'Font1',
    fontSize: screenHeight * 0.02,
  ),
  onPressed: () {},
),

SizedBox(height: screenHeight*0.04,),

// NEW: Divider with text
Padding(
  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
  child: Row(
    children: [
      const Expanded(
        child: Divider(
          color: Color(0xff969292),
          thickness: 1,
          endIndent: 10,
        ),
      ),
      Text(
        'or continue with',
        style: TextStyle(
          fontFamily: 'Font1',
          fontSize: screenHeight * 0.017,
          color: const Color(0xff969292),
        ),
      ),
      const Expanded(
        child: Divider(
          color: Color(0xff969292),
          thickness: 1,
          indent: 10,
        ),
      ),
    ],
  ),
),

SizedBox(height: screenHeight*0.04,),


ButtonUtil.customElevatedButton(
  context: context,
  buttonColor: const Color(0xff7871F8),
  text: "Sign in with Google",
  buttonSize: Size(screenWidth * 0.88, screenHeight * 0.065),
  textStyle: TextStyle(
    fontFamily: 'Font1',
    color: Color(0xffF2F1FE),
    fontSize: screenHeight * 0.02,
  ),
  onPressed: () {},
),

              SizedBox(height: screenHeight * 0.025),

              // Sign Up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New Here?",
                    style: TextStyle(
                      fontFamily: 'Font1',
                      fontSize: screenHeight * 0.018,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  InkWell(
                    onTap: () {
                      // TODO: Navigate to signup
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                        fontFamily: 'Font1',
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffC9C6FC),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
