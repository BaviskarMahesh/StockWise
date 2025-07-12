import 'package:flutter/material.dart';
import 'package:stockwise/routes/app_routes.dart';
import 'package:stockwise/utils/textfield.dart';
import 'package:stockwise/utils/elevated_Button.dart';

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

         
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.015),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Font1',
                      fontSize: screenHeight * 0.036,  
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
                labelText: "Email address",
                prefixIcon: Icons.email_outlined,
                prefixIconColor: const Color(0xff969292),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Password TextField
              TextfieldUtil.customTextField(
                context: context,
                controller: password,
                labelText: "Password",
                prefixIcon: Icons.lock,
                obscureText: passWordVisible,
                suffixIcon:
                    passWordVisible
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
                      Navigator.pushNamed(context, AppRoutes.forgotPassword);
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
              SizedBox(height: screenHeight * 0.02),
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
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.organizationRegistration,
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.04),

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

              SizedBox(height: screenHeight * 0.04),

              Center(
                child: InkWell(
                  onTap: () {
                    //
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: screenWidth * 0.88,
                    height: screenHeight * 0.065,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xffF2F1FE,
                      ), // Same as screen background
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(
                            255,
                            148,
                            141,
                            141,
                            // ignore: deprecated_member_use
                          ).withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      // border: Border.all(color: const Color(0xff7871F8), width: 1.2), // Optional: subtle border
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'lib/assets/images/icons/google_icon.png',
                      height: screenHeight * 0.035,
                    ),
                  ),
                ),
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
                      Navigator.pushNamed(context, AppRoutes.registerScreen);
                      //
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                        fontFamily: 'Font1',
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff7871F8),
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
