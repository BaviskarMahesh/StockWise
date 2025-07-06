import 'package:flutter/material.dart';
import 'package:stockwise/Auth/forgotpswd.dart';
import 'package:stockwise/Auth/login_screen.dart';
import 'package:stockwise/Auth/register_screen.dart';

class AppRoutes {
  static const String loginScreen = '/';
  static const String registerScreen = '/registerScreen';
  static const String forgotPassword = '/forgotPassword';

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const Forgotpswd());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => const Scaffold(
            body: Center(
              child: Text(
                "Page not found!",
                style: TextStyle(fontFamily: 'Font1'),
              ),
            ),
          ),
    );
  }
}
