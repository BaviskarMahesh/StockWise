import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stockwise/utils/animatedFAB.dart';
import 'package:stockwise/utils/custom_bottomNavBar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(
      child: Text("Home", style: TextStyle(fontFamily: 'Font1')),
    ),
    const Center(
      child: Text("Items", style: TextStyle(fontFamily: 'Font1')),
    ),
    const Center(
      child: Text("Stats", style: TextStyle(fontFamily: 'Font1')),
    ),
    const Center(
      child: Text("Menu", style: TextStyle(fontFamily: 'Font1')),
    ),
  ];

  String get formattedDate {
    return DateFormat("EEE, d MMM yy").format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF2F1FE),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              
              Row(
                children: [
                  const Icon(Icons.wb_sunny, color: Colors.deepPurple),
                  const SizedBox(width: 8),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontFamily: 'Font1',
                      color: Colors.deepPurple,
                      fontSize: height * 0.018,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Welcome, Mahesh!',
                style: TextStyle(
                  fontFamily: 'Font1',
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.03,
                ),
              ),
              const SizedBox(height: 20),

              /// 🟣 Inventory Summary on Home Tab
              if (_currentIndex == 0) inventorySummaryCard(context),

              const SizedBox(height: 10),
              _pages[_currentIndex],
            ],
          ),
        ),
      ),

      /// FAB + Bottom Navigation
      floatingActionButton: const AnimatedGradientFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  /// 📦 Inventory Summary Card
  Widget inventorySummaryCard(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: RightSideCurveClipper(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 0.05),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF9D7AF5), Color(0xFFB69DF8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.inventory_2, color: Colors.white),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Inventory Summary',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.022,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Font1',
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: screenWidth * 0.04,
              mainAxisSpacing: screenHeight * 0.015,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 3.0,
              children: [
                _summaryItem("Category", "24", Icons.category),
                _summaryItem("Folders", "15", Icons.folder),

                _summaryItem("Total Qty", "479 Items", Icons.inventory),
                _summaryItem("Total Value", "\$1,067.50", Icons.attach_money),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryItem(String title, String value, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.white),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontFamily: 'Font1',
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: 'Font1',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RightSideCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.8, size.height);
    path.quadraticBezierTo(
      size.width,
      size.height * 0.9,
      size.width,
      size.height * 0.5,
    );
    path.quadraticBezierTo(size.width, 0, size.width * 0.75, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
