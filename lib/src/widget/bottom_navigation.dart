import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onItemTapped;
  const BottomNavigation(
      {super.key, required this.currentIndex, this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 4,
      currentIndex: currentIndex,
      onTap: onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shop,
            color: Colors.black,
          ),
          label: "Explore",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: "Cart"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            label: "Wishlist"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_rounded,
              color: Colors.black,
            ),
            label: "Profile"),
      ],
    );
  }
}
