import 'package:emart/src/home/screen/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/model/product.dart';

class ProductList extends HookConsumerWidget {
  final List<Product> products;
  const ProductList({super.key, required this.products});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MasonryGridView.count(
      itemCount: products.length,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        return ProductCard(
          data: products[index],
        );
      },
    );
  }
}
