import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const StockWiseApp());
}

class StockWiseApp extends StatelessWidget {
  const StockWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     // Add your providers here later
    //   ],
    return MaterialApp(
      
        debugShowCheckedModeBanner: false,
        title: 'StockWise',
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.loginScreen,
      
    );
  }
}
