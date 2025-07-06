import 'package:flutter/material.dart';

class TextfieldUtil {
  static InputDecoration inputDecoration({
    required BuildContext context,
    String? hintText,
    TextStyle? hintStyle,
    IconData? prefixIcon,
    Color? prefixIconColor,
    Widget? suffixIcon,
    Color? suffixIconColor,
  }) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenHeight * 0.017;  

    
    final double verticalPadding = screenHeight * 0.013;
    final double horizontalPadding = screenWidth * 0.04;

    return InputDecoration(
      
      hintText: hintText,
      hintStyle: hintStyle ??
          TextStyle(
            color: const Color(0xff969292),
            fontFamily: 'Font1',
            fontSize: fontSize,
          ),
      filled: true,
      fillColor: const Color(0xffF2F1FE),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 202, 195, 195),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xffC9C6FC),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xff969292),
        ),
      ),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: prefixIconColor ?? const Color(0xff969292),
            )
          : null,
      suffixIcon: suffixIcon,
    );
  }

  static Widget customTextField({
    required BuildContext context,
    required TextEditingController controller,
    String? hintText,
    TextStyle? hintStyle,
    IconData? prefixIcon,
    Color? prefixIconColor,
    IconData? suffixIcon,
    Color? suffixIconColor,
    VoidCallback? onSuffixIconPressed,
    bool obscureText = false,
    Color cursorColor = const Color(0xff969292),
    TextInputType keyboardType = TextInputType.text,
    void Function(String)? onChanged,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: cursorColor,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: inputDecoration(
        context: context,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(
                  suffixIcon,
                  color: suffixIconColor ?? const Color(0xff969292),
                ),
                onPressed: onSuffixIconPressed,
              )
            : null,
      ),
    );
  }
}
