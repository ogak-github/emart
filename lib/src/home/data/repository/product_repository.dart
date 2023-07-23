import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emart/core/constant/variables.dart';
import 'package:emart/core/database/shared_preferences/prefs_client.dart';
import 'package:emart/core/dio/dio_client.dart';
import 'package:emart/core/dio/dio_exceptions.dart';
import 'package:emart/core/shared/shared_provider.dart';
import 'package:emart/src/home/data/model/product.dart';
import 'package:emart/src/home/data/repository/product_interface.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/single_product.dart';

final productRepositoryProvider = Provider(
  (ref) => ProductRepository(
      ref.read(dioClientProvider), ref.read(prefsClientProvider)),
);

class ProductRepository implements ProductInterface {
  final DioClient _dioClient;
  final PrefsClient _prefsClient;
  ProductRepository(this._dioClient, this._prefsClient);
  @override
  Future<List<Product>> getAllProducts({int? limit, String? sort}) async {
    try {
      final response = await _dioClient
          .get("${Variables.baseUrl}/products?limit=$limit&sort=$sort");
      if (response.statusCode == 200) {
        final data = response.data;
        List<Product> products =
            (data as List).map((e) => Product.fromJson(e)).toList();
        return products;
      }
      return [];
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
      return [];
    }
  }

  @override
  Future<SingleProduct?> singleProduct(String id) async {
    try {
      final response =
          await _dioClient.get("${Variables.baseUrl}/products/$id");
      final data = SingleProduct.fromJson(response.data);
      if (response.statusCode == 200) {
        return data;
      }
      return null;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
      return null;
    }
  }
}
