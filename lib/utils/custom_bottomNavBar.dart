import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final List<IconData> icons = [
      Icons.home,
      Icons.inventory_2_outlined,
      Icons.bar_chart,
      Icons.menu,
    ];

    final List<String> labels = [
      'Home',
      'Items',
      'Stats',
      'Menu',
    ];

    return BottomAppBar(
      color: const Color(0xffF2F1FE),
      shape: const CircularNotchedRectangle(),
      notchMargin: screenWidth * 0.025,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: SizedBox(
          height: screenHeight * 0.09,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                  2,
                  (index) => _buildItem(index, icons, labels, screenHeight, screenWidth),
                ),
              ),
              Row(
                children: List.generate(
                  2,
                  (index) => _buildItem(index + 2, icons, labels, screenHeight, screenWidth),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
    int index,
    List<IconData> icons,
    List<String> labels,
    double screenHeight,
    double screenWidth,
  ) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: SizedBox(
        width: screenWidth * 0.18,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons[index],
              color: isSelected ? const Color(0xff7871F8) : Colors.black,
              size: screenHeight * 0.03,
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              labels[index],
              style: TextStyle(
                fontSize: screenHeight * 0.015,
                fontFamily: 'Font1',
                color: isSelected ? const Color(0xff7871F8) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
