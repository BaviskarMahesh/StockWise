import 'package:flutter/material.dart';
import 'package:stockwise/utils/elevated_Button.dart';
import 'package:stockwise/utils/textfield.dart';
 

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool passwordVisible = false;

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
              SizedBox(height: screenHeight * 0.19),

              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.015),
                child: Text(
                  "Create your account",
                  style: TextStyle(
                    fontFamily: 'Font1',
                    fontSize: screenHeight * 0.034,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.06),

              // Full Name
              TextfieldUtil.customTextField(
                context: context,
                controller: fullName,
                labelText: "Enter your full name",
                prefixIcon: Icons.person,
              ),
              SizedBox(height: screenHeight * 0.02),

              // Email
              TextfieldUtil.customTextField(
                context: context,
                controller: email,
                labelText: "Enter your Email address",
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: screenHeight * 0.02),

              // Password
              TextfieldUtil.customTextField(
                context: context,
                controller: password,
                labelText: "Create a Password",
                prefixIcon: Icons.lock,
                obscureText: passwordVisible,
                suffixIcon: passwordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                onSuffixIconPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),

              SizedBox(height: screenHeight * 0.03),

              // Create Account Button
              ButtonUtil.customElevatedButton(
                context: context,
                buttonColor: const Color(0xff7871F8),
                text: "Create Account",
                buttonSize: Size(screenWidth * 0.88, screenHeight * 0.065),
                textStyle: TextStyle(
                  color: const Color(0xffF2F1FE),
                  fontFamily: 'Font1',
                  fontSize: screenHeight * 0.02,
                ),
                onPressed: () {},
              ),

              SizedBox(height: screenHeight * 0.04),

              // Divider with text
              Row(
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

              SizedBox(height: screenHeight * 0.04),

              // Google Icon Button
              Center(
                child: InkWell(
                  onTap: () {
                    
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: screenWidth * 0.88,
                    height: screenHeight * 0.065,
                    decoration: BoxDecoration(
                      color: const Color(0xffF2F1FE),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 148, 141, 141)
                              // ignore: deprecated_member_use
                              .withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
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

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontFamily: 'Font1',
                      fontSize: screenHeight * 0.018,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  InkWell(
                    onTap: () {
                       
                    },
                    child: Text(
                      "Login",
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
