import 'package:emart/src/home/screen/product_list.dart';
import 'package:emart/src/home/state/product_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProducts = ref.watch(productStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
      ),
      body: getProducts.when(
        data: (products) {
          return ProductList(products: products);
        },
        error: (err, stackTrace) => Center(
          child: Text(
            err.toString(),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
