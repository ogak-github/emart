import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onItemTapped;
  const BottomNavigation(
      {super.key, required this.currentIndex, this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      elevation: 4,
      currentIndex: currentIndex,
      onTap: onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.storefront,
            size: 30,
          ),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            size: 30,
          ),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            size: 30,
          ),
          label: "Wishlist",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_2_rounded,
            size: 30,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
