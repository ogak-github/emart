import '../model/cart.dart';

abstract class CartInterface {
  //Future<List<Cart>> getAll();
  Future<List<Cart>> getUserCart(String userId);
}
