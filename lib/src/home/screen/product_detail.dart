import 'package:emart/src/home/screen/button_action.dart';
import 'package:emart/src/home/screen/detail_card.dart';
import 'package:emart/src/home/state/single_product_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDetail extends HookConsumerWidget {
  final String id;
  const ProductDetail({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(singleProductStateProvider(id));
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
          forceMaterialTransparency: true,
          ),
      body: product.when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailCard(product: data!),
              ],
            ),
          );
        },
        error: (err, stackTrace) => const SizedBox.shrink(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: ButtonAction(),
      ),
    );
  }
}
