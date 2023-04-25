import 'package:emart/src/widget/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      body: IndexedStack(),
      bottomNavigationBar: BottomNavigation(
        currentIndex: currentIndex,
        onItemTapped: (int index) {
          currentIndex = index;
        },
      ),
    );
  }
}
