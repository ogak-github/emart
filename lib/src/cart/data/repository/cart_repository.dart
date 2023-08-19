import 'dart:developer';

import 'package:emart/core/constant/variables.dart';
import 'package:emart/core/database/shared_preferences/prefs_client.dart';
import 'package:emart/core/dio/dio_client.dart';
import 'package:emart/core/shared/shared_provider.dart';
import 'package:emart/src/cart/data/model/cart.dart';
import 'package:emart/src/cart/data/repository/cart_interface.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cartRepository = Provider(
  (ref) => CartRepository(
    ref.read(dioClientProvider),
    ref.read(prefsClientProvider),
  ),
);

class CartRepository implements CartInterface {
  final DioClient _dioClient;
  final PrefsClient _prefsClient;

  CartRepository(this._dioClient, this._prefsClient);
  @override
  Future<List<Cart>> getUserCart(String userId) async {
    try {
      final response =
          await _dioClient.get("${Variables.baseUrl}/carts/user/$userId");

      if (response.statusCode == 200) {
        final data = response.data;
        List<Cart> carts = (data as List).map((e) => Cart.fromJson(e)).toList();
        return carts;
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
