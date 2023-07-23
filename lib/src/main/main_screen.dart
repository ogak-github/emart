import 'package:emart/src/cart/screen/cart_page.dart';
import 'package:emart/src/home/screen/home.dart';
import 'package:emart/src/profile/screen/profile_page.dart';
import 'package:emart/src/wishlist/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/bottom_navigation.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indexProvider);
    List<Widget> pages = [
      const Home(),
      const CartPage(),
      const WishlistPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: currentIndex,
        onItemTapped: (int index) {
          ref.read(indexProvider.notifier).state = index;
        },
      ),
    );
  }
}
