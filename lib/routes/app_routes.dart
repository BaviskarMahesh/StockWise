import 'package:flutter/material.dart';
import 'package:stockwise/Auth/forgotpswd.dart';
import 'package:stockwise/Auth/login_screen.dart';
import 'package:stockwise/Auth/register_screen.dart';
import 'package:stockwise/screens/AddressDetail_Screen.dart';
import 'package:stockwise/screens/barcode_Scanner.dart';
import 'package:stockwise/screens/homescreen.dart';
import 'package:stockwise/screens/organization_registration.dart';

class AppRoutes {
  static const String loginScreen = '/';
  static const String registerScreen = '/registerScreen';
  static const String forgotPassword = '/forgotPassword';
  static const String organizationRegistration = '/organizationRegistration';
  static const String addressDetailScreen = '/addressDetailScreen';
  static const String homescreen = '/homescreen';
  static const String barcodeScanner = '/barcodeScanner';

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const Forgotpswd());
      case organizationRegistration:
        return MaterialPageRoute(
          builder: (_) => const OrganizationRegistration(),
        );
      case addressDetailScreen:
        return MaterialPageRoute(builder: (_) => AddressdetailScreen());
      case homescreen:
        return MaterialPageRoute(builder: (_) => Homescreen());
      case barcodeScanner:
        return MaterialPageRoute(builder: (_) => BarcodeScannerScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text("Page not found!", style: TextStyle(fontFamily: 'Font1')),
        ),
      ),
    );
  }
}
