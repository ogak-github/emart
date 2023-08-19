import 'package:flutter/material.dart';
import '../data/model/single_product.dart';

class DetailCard extends StatelessWidget {
  final SingleProduct product;
  const DetailCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //padding: const EdgeInsets.all(8),
          constraints: BoxConstraints.tight(const Size(200, 275)),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(product.image),
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(product.title,
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("\$ ${product.price.toString()}",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Product Description",
                    style: Theme.of(context).textTheme.labelLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(product.description,
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
