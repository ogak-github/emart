import 'package:emart/src/home/data/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/model/product.dart';
part 'product_state.g.dart';

@riverpod
class ProductState extends _$ProductState {
  @override
  Future<List<Product>> build() async {
    return getAllProducts();
  }

  Future<List<Product>> getAllProducts(
      {int? limit = 20, String? sort = "asc"}) async {
    state = const AsyncLoading();
    final repo = ref.watch(productRepositoryProvider);
    final products = await repo.getAllProducts(limit: limit, sort: sort);
    state = AsyncValue.data(products);
    return products;
  }
}
