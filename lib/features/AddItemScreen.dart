// // ignore: file_names
// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
 
import 'package:stockwise/utils/elevated_Button.dart';
import 'package:stockwise/utils/textfield.dart';
   

class Additemscreen extends StatefulWidget {
  const Additemscreen({super.key});

  @override
  State<Additemscreen> createState() => _AdditemscreenState();
}

class _AdditemscreenState extends State<Additemscreen> {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF2F1FE),
      appBar: AppBar(
        title: Text(
          "Add Item",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Name
            TextfieldUtil.customTextField(
              context: context,
              controller: itemNameController,
              labelText: "Item Name",
              prefixIcon: Icons.shopping_bag,
            ),
            SizedBox(height: height * 0.025),

            // Add Image
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.018,
                  horizontal: width * 0.04,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF2F1FE),
                  border: Border.all(
                    color: const Color(0xffC9C6FC),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add_a_photo, color: const Color(0xff7871F8)),
                    SizedBox(width: width * 0.03),
                    Text(
                      _imageFile == null ? "Add Image" : "Image Selected",
                      style: TextStyle(
                        color: const Color(0xff7871F8),
                        fontSize: height * 0.018,
                        fontFamily: 'Font1',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_imageFile != null)
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    _imageFile!,
                    height: height * 0.25,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: height * 0.025),

         
            TextfieldUtil.customTextField(
              context: context,
              controller: skuController,
              labelText: "SKU",
              prefixIcon: Icons.qr_code,
            ),
            SizedBox(height: height * 0.025),

             
            TextfieldUtil.customTextField(
              context: context,
              controller: unitController,
              labelText: "Unit",
              prefixIcon: Icons.scale,
            ),
            SizedBox(height: height * 0.04),

            
            ButtonUtil.customElevatedButton(
              context: context,
              text: "Save",
              buttonColor: const Color(0xff7871F8),
              onPressed: () {
                // Save logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Item Saved")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
