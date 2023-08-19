import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ButtonAction extends HookConsumerWidget {
  const ButtonAction({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text("Add to cart"),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline_outlined),
            label: const Text("Add to Wishlist"),
          ),
        ],
      ),
    );
  }
}
