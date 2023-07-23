import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WishlistPage extends HookConsumerWidget {
  const WishlistPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: const Center(
        child: Text("Wishlist"),
      ),
    );
  }
}
