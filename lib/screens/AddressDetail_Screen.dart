// import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:stockwise/constants/indian_state.dart';
import 'package:stockwise/routes/app_routes.dart';

import 'package:stockwise/utils/elevated_Button.dart';
import 'package:stockwise/utils/textfield.dart';

class AddressdetailScreen extends StatefulWidget {
  const AddressdetailScreen({super.key});

  @override
  State<AddressdetailScreen> createState() => _AddressdetailScreenState();
}

class _AddressdetailScreenState extends State<AddressdetailScreen> {
  final TextEditingController streetAddress1 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController postalCode = TextEditingController();
  String? selectedState;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff7871F8),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Organization Address",
          style: TextStyle(
            fontFamily: 'Font1',
            color: Colors.white,
            fontSize: screenHeight * 0.022,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      backgroundColor: const Color(0xffF2F1FE),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.03),

            // Street Address 1
            TextfieldUtil.customTextField(
              context: context,
              controller: streetAddress1,
              labelText: 'Street Address 1',
              prefixIcon: Icons.home_outlined,
            ),
            SizedBox(height: screenHeight * 0.025),

            // State / Province DropdownSearch
            SizedBox(height: screenHeight * 0.01),
            DropdownSearch<String>(
              items: indianStates,
              selectedItem: selectedState,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Select State / Province",
                  labelStyle: TextStyle(
                    fontFamily: 'Font1',
                    color: Color(0xff969292),
                  ),
                  prefixIcon: const Icon(
                    Icons.map_outlined,
                    color: Color(0xff969292),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff969292)),
                  ),
                ),
              ),
              popupProps: PopupProps.menu(
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    labelText: "Search State",
                    labelStyle: TextStyle(
                      fontFamily: 'Font1',
                      color: Color(0xff969292),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xff969292),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedState = value;
                });
              },
            ),

            SizedBox(height: screenHeight * 0.025),

            // City
            TextfieldUtil.customTextField(
              context: context,
              controller: city,
              labelText: 'City',
              prefixIcon: Icons.location_city,
            ),
            SizedBox(height: screenHeight * 0.025),

            // Postal Code
            TextfieldUtil.customTextField(
              context: context,
              controller: postalCode,
              labelText: 'Postal Code',
              keyboardType: TextInputType.number,
              prefixIcon: Icons.markunread_mailbox_outlined,
            ),
            SizedBox(height: screenHeight * 0.04),

            // Save Button
            Center(
              child: ButtonUtil.customElevatedButton(
                context: context,
                buttonColor: const Color(0xff7871F8),
                text: "Save Address",
                buttonSize: Size(screenWidth * 0.88, screenHeight * 0.065),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Font1',
                  fontSize: screenHeight * 0.02,
                ),
                onPressed: () {
                  // Save address logic
                  Navigator.pushNamed(context, AppRoutes.homescreen);
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
          ],
        ),
      ),
    );
  }
}
