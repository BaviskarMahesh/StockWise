// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:stockwise/utils/elevated_Button.dart';
import 'package:stockwise/utils/textfield.dart';
 

class BillingaddressScreen extends StatefulWidget {
  const BillingaddressScreen({super.key});

  @override
  State<BillingaddressScreen> createState() => _BillingaddressScreenState();
}

class _BillingaddressScreenState extends State<BillingaddressScreen> {
  final TextEditingController attentionController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF2F1FE),
      appBar: AppBar(
        title: Text(
          "Billing Address",
          style: TextStyle(
            fontFamily: 'Font1',
            color: Colors.white,
            fontSize: height * 0.022,
          ),
        ),
        backgroundColor: const Color(0xff7871F8),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.025),
        child: Column(
          children: [
            TextfieldUtil.customTextField(
              context: context,
              controller: attentionController,
              labelText: "Attention",
              prefixIcon: Icons.person,
            ),
            SizedBox(height: height * 0.02),

            TextfieldUtil.customTextField(
              context: context,
              controller: streetController,
              labelText: "Street",
              prefixIcon: Icons.location_on,
            ),
            SizedBox(height: height * 0.02),

            TextfieldUtil.customTextField(
              context: context,
              controller: cityController,
              labelText: "City",
              prefixIcon: Icons.location_city,
            ),
            SizedBox(height: height * 0.02),

            TextfieldUtil.customTextField(
              context: context,
              controller: stateController,
              labelText: "State",
              prefixIcon: Icons.map,
            ),
            SizedBox(height: height * 0.02),

            TextfieldUtil.customTextField(
              context: context,
              controller: pinCodeController,
              labelText: "Pin Code",
              prefixIcon: Icons.pin,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.02),

            TextfieldUtil.customTextField(
              context: context,
              controller: countryController,
              labelText: "Country / Region",
              prefixIcon: Icons.public,
            ),
            SizedBox(height: height * 0.02),

            TextfieldUtil.customTextField(
              context: context,
              controller: phoneController,
              labelText: "Phone",
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: height * 0.04),

            ButtonUtil.customElevatedButton(
              context: context,
              text: "Save",
              buttonColor: const Color(0xff7871F8),
              onPressed: () {
                // Save logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Saved Successfully")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
