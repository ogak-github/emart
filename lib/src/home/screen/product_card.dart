import 'package:emart/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/model/product.dart';

class ProductCard extends HookConsumerWidget {
  final Product data;
  const ProductCard({super.key, required this.data});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.grey,
        onTap: () {
          context.push("${Routes.product}/${data.id}");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                child: Image.network(
                  data.image,
                  fit: BoxFit.fitWidth,
                  height: 160,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(data.title),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${data.price.toString()}",
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      IconButton.outlined(
                          onPressed: () {}, icon: const Icon(Icons.favorite))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
