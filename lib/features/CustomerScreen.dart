import 'package:flutter/material.dart';
import 'package:stockwise/features/BillingAddress_Screen.dart';
 
import 'package:stockwise/utils/textfield.dart';  

class Customerscreen extends StatefulWidget {
  const Customerscreen({super.key});

  @override
  State<Customerscreen> createState() => _CustomerscreenState();
}

class _CustomerscreenState extends State<Customerscreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF2F1FE),
      appBar: AppBar(
        title: Text(
          "Add a Customer",
          style: TextStyle(
            fontFamily: 'Font1',
            color: Colors.white,
            fontSize: height * 0.022,
          ),
        ),
        backgroundColor: const Color(0xff7871F8),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.015),
                TextfieldUtil.customTextField(
                  context: context,
                  controller: firstNameController,
                  labelText: "First Name",
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: height * 0.02),
                TextfieldUtil.customTextField(
                  context: context,
                  controller: lastNameController,
                  labelText: "Last Name",
                  prefixIcon: Icons.person_outline,
                ),
                SizedBox(height: height * 0.02),
                TextfieldUtil.customTextField(
                  context: context,
                  controller: companyController,
                  labelText: "Company Name",
                  prefixIcon: Icons.business,
                ),
                SizedBox(height: height * 0.02),
                TextfieldUtil.customTextField(
                  context: context,
                  controller: emailController,
                  labelText: "Email Address",
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: height * 0.02),
                TextfieldUtil.customTextField(
                  context: context,
                  controller: phoneController,
                  labelText: "Phone",
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: height * 0.02),
                TextfieldUtil.customTextField(
                  context: context,
                  controller: mobileController,
                  labelText: "Mobile",
                  prefixIcon: Icons.smartphone,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: height * 0.04),
               GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const BillingaddressScreen()),
    );
  },
  child: Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.add_box_sharp,
          color: const Color(0xff7871F8),
          size: height * 0.022,
        ),
        SizedBox(width: width * 0.01),
        Text(
          "Add Billing and Shipping Address",
          style: TextStyle(
            color: const Color(0xff7871F8),
            fontSize: height * 0.019,
            fontFamily: 'Font1',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  ),
),

                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
