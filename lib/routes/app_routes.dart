import 'package:flutter/material.dart';
import 'package:stockwise/Auth/login_screen.dart';

class AppRoutes {
  static const String loginScreen = '/';

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

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
