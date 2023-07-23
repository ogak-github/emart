import 'package:emart/src/home/data/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/model/single_product.dart';
part 'single_product_state.g.dart';

@riverpod
class SingleProductState extends _$SingleProductState {
  @override
  FutureOr<SingleProduct?> build(String id) async {
    return getSingleProduct(id);
  }

  Future<SingleProduct?> getSingleProduct(String id) async {
    state = const AsyncLoading();
    final repo = ref.watch(productRepositoryProvider);
    final singleProduct = await repo.singleProduct(id);
    state = AsyncValue.data(singleProduct);
    return singleProduct;
  }
}
