import 'package:emart_v2/ui/components/err_message.dart';
import 'package:emart_v2/ui/components/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/product_provider.dart';

class GridViewProduct extends ConsumerStatefulWidget {
  const GridViewProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GridViewProductState();
}

class _GridViewProductState extends ConsumerState<GridViewProduct> {
  @override
  Widget build(BuildContext context) {
    final allProducts = ref.watch(allProductsProvider());
    return allProducts.when(
      data: (products) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Image.network(product.image),
                          ),
                        ),
                        SizedBox(height: 3),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.category,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text(
                              product.title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text("\$ ${product.price}"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      error: (err, _) => ErrMessage(
        errMessage: err.toString(),
      ),
      loading: () => LoadingProgress(),
    );
  }
}
