import 'package:emart/src/cart/data/model/cart.dart';
import 'package:emart/src/cart/state/cart_state.dart';
import 'package:emart/src/home/data/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartPage extends HookConsumerWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCart = ref.watch(cartStateProvider("1"));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: userCart.when(
            data: (carts) {
              return ListView.builder(
                  itemCount: carts.length,
                  itemBuilder: (context, index) {
                    final cart = carts[index];
                    List<ProductInCart> cartItem = cart.products!.toList();
                    return ExpansionTile(
                      title: Text("Order ID: ${cart.id.toString()}"),
                      children: [
                        for (var item in cartItem)
                          FutureBuilder(
                              future: ref
                                  .watch(productRepositoryProvider)
                                  .singleProduct(item.productId.toString()),
                              builder: (context, snapshot) {
                                final productDetail = snapshot.data;
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                } else {
                                  return ListTile(
                                    title: Text("${productDetail?.title}"),
                                    trailing: Text("Qty: ${item.quantity}"),
                                  );
                                }
                              }),
                      ],
                    );
                  });
            },
            error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
            loading: () => const CircularProgressIndicator()));
  }
}
