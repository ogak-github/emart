import 'package:emart_v2/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/model/product.dart';

part 'product_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Product>> allProducts(AllProductsRef ref,
    {int? limit, String? sort}) async {
  final repo = ref.watch(productRepoProvider);
  return repo.getAllProducts(limit: limit, sort: sort);
}

@Riverpod(keepAlive: true)
Future<List<String>> getCategories(GetCategoriesRef ref) async {
  final repo = ref.watch(productRepoProvider);
  return repo.allCategories();
}
