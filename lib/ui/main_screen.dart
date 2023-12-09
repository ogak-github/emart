import 'package:emart_v2/core/database/user_setting.dart';
import 'package:emart_v2/ui/cart/cart_screen.dart';
import 'package:emart_v2/ui/home/home_screen.dart';
import 'package:emart_v2/ui/profile/profile_screen.dart';
import 'package:emart_v2/ui/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/bottom_navigation.dart';

class MainScreen extends ConsumerWidget {
  static const path = "/";
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(screenIndexProvider);
    List<Widget> pages = [
      const HomeScreen(),
      const CartScreen(),
      const WishlistScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: currentIndex,
        onItemTapped: (int index) {
          ref.read(screenIndexProvider.notifier).currentIndex(index);
        },
      ),
    );
  }
}

final screenIndexProvider =
    StateNotifierProvider<ScreenIndex, int>((ref) => ScreenIndex(ref));

class ScreenIndex extends StateNotifier<int> {
  final Ref _ref;
  ScreenIndex(this._ref) : super(0) {
    getCurrentIndex();
  }

  int currentIndex(int i) {
    final db = _ref.watch(userSettingProvider);
    db.setSetting("current_index_page", i);
    return state = i;
  }

  int getCurrentIndex() {
    final db = _ref.watch(userSettingProvider);
    db.getSetting("current_index_page").then((value) {
      if (value != null) {
        state = value;
      } else {
        state = 0;
      }
    });
    return state;
  }
}
