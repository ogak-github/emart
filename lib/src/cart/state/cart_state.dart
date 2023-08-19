import 'package:emart/src/cart/data/repository/cart_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/model/cart.dart';

part 'cart_state.g.dart';

@riverpod
class CartState extends _$CartState {
  @override
  Future<List<Cart>> build(String userId) async {
    return await getUserCart(userId);
  }

  Future<List<Cart>> getUserCart(String userId) async {
    state = const AsyncLoading();
    final repo = ref.watch(cartRepository);
    final carts = await repo.getUserCart(userId);
    state = AsyncValue.data(carts);
    return carts;
  }
}
