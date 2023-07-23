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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: product.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    data!.image,
                    height: 200,
                    width: double.infinity,
                  ),
                  Text(
                    data.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "\$ ${data.price.toString()}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    data.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(data.category),
                  Text(data.rating.rate.toString())
                ],
              ),
            ),
          );
        },
        error: (err, stackTrace) => const SizedBox.shrink(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
