import 'package:flutter/material.dart';
import 'package:stockwise/routes/app_routes.dart';
import 'package:stockwise/utils/elevated_Button.dart';
import 'package:stockwise/widgets/gradient_header.dart';
import 'package:stockwise/utils/textfield.dart';
import 'package:stockwise/constants/industry_list.dart';
import 'package:intl/intl.dart';

class OrganizationRegistration extends StatefulWidget {
  const OrganizationRegistration({super.key});

  @override
  State<OrganizationRegistration> createState() =>
      _OrganizationRegistrationState();
}

class _OrganizationRegistrationState extends State<OrganizationRegistration> {
  final TextEditingController orgName = TextEditingController();
  final TextEditingController orgAddress = TextEditingController();
  final TextEditingController inventoryStartDate = TextEditingController();
  final TextEditingController ownerName = TextEditingController();

  String? selectedIndustry;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF2F1FE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GradientHeader(
              title: 'Get Started',
              subText:
                  'with StockWise Add your Organization information to continue',
            ),

            SizedBox(height: screenHeight * 0.03),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                children: [
                  // Organization Name
                  TextfieldUtil.customTextField(
                    context: context,
                    controller: orgName,
                    labelText: "Organization Name",
                    prefixIcon: Icons.business,
                  ),
                  SizedBox(height: screenHeight * 0.025),

                  // Owner Name
                  TextfieldUtil.customTextField(
                    context: context,
                    controller: ownerName,
                    labelText: "Owner / Manager Name",
                    prefixIcon: Icons.person_outline,
                  ),
                  SizedBox(height: screenHeight * 0.025),

                  // Address
                  // Address Field (GestureDetector)
                  // Tappable Address Field (no TextField)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.addressDetailScreen,
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: const Color(0xff7871F8),
                          size: screenHeight * 0.025,
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Text(
                          'Add Organization Address',
                          style: TextStyle(
                            fontSize: screenHeight * 0.017,
                            fontFamily: 'Font1',
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff7871F8),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.025),

                  // Inventory Start Date (with date picker)
                  TextField(
                    controller: inventoryStartDate,
                    readOnly: true,
                    decoration: TextfieldUtil.inputDecoration(
                      context: context,
                      labelText: 'Inventory Start Date',
                      prefixIcon: Icons.date_range,
                    ),
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          inventoryStartDate.text = DateFormat(
                            'dd/MM/yyyy',
                          ).format(pickedDate);
                        });
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.025),

                  // Industry Dropdown
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.005,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF2F1FE),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 202, 195, 195),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedIndustry,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        hint: Text(
                          "Select Business Industry",
                          style: TextStyle(
                            fontSize: screenHeight * 0.017,
                            fontFamily: 'Font1',
                            color: const Color(0xff969292),
                          ),
                        ),
                        items: industryList.map((industry) {
                          return DropdownMenuItem(
                            value: industry,
                            child: Text(
                              industry,
                              style: TextStyle(
                                fontSize: screenHeight * 0.017,
                                fontFamily: 'Font1',
                                color: Color(0xff7871F8),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedIndustry = value;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.05),
                  // Continue Button
ButtonUtil.customElevatedButton(
  context: context,
  buttonColor: const Color(0xff7871F8),
  text: "Continue",
  buttonSize: Size(screenWidth * 0.88, screenHeight * 0.065),
  textStyle: TextStyle(
    color: Colors.white,
    fontFamily: 'Font1',
    fontSize: screenHeight * 0.02,
  ),
  onPressed: () {
    // Handle validation or navigation here
    if (orgName.text.isEmpty ||
        ownerName.text.isEmpty ||
        inventoryStartDate.text.isEmpty ||
        selectedIndustry == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the details.")),
      );
    } else {
      
      Navigator.pushNamed(context, AppRoutes.addressDetailScreen);  
    }
  },
),
SizedBox(height: screenHeight * 0.04),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
