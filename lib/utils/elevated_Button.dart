import 'package:flutter/material.dart';

class ButtonUtil {
  static Widget customElevatedButton({
    required BuildContext context,
    required String text,
    VoidCallback? onPressed,
    Color? buttonColor,
    TextStyle? textStyle,
    Size? buttonSize,
    double? widthFactor,
    double? height,
    Color? splashColor,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double defaultFontSize = screenHeight * 0.02;  
    final double defaultHeight = screenHeight * 0.068;  
    final double defaultWidth = screenWidth * (widthFactor ?? 0.90);  
    final Size effectiveSize = buttonSize ?? Size(defaultWidth, height ?? defaultHeight);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? const Color(0xff312F2F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Same as textfield
        minimumSize: effectiveSize,
        elevation: 4,
        // ignore: deprecated_member_use
        shadowColor: const Color.fromARGB(255, 148, 141, 141).withOpacity(0.3),
        splashFactory: InkRipple.splashFactory,
      ),
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              fontSize: defaultFontSize,
              color: Colors.white,
              fontFamily: 'Font1',
            ),
      ),
    );
  }
}
