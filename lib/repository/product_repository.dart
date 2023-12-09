import 'package:emart_v2/core/dio/dio_client.dart';
import 'package:emart_v2/core/dio/dio_exception.dart';
import 'package:emart_v2/core/interface/product_datasource.dart';
import 'package:emart_v2/core/model/product.dart';
import 'package:emart_v2/core/model/single_product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepoProvider =
    Provider((ref) => ProductRepository(ref.watch(dioClientProvider)));

class ProductRepository extends ProductDatasource {
  final DioClient _dioClient;

  ProductRepository(this._dioClient);
  @override
  Future<List<String>> allCategories() async {
    try {
      final response =
          await _dioClient.get("${DioClient.baseUrl}/products/categories");
      if (response.statusCode == 200) {
        final data = response.data as List;
        List<String> categories = data.map((e) => e.toString()).toList();
        return categories;
      }
      return [];
    } on DioError catch (er) {
      DioExceptions.fromDioError(er);
      return [];
    }
  }

  @override
  Future<List<Product>> getAllProducts({int? limit, String? sort}) async {
    try {
      final response = await _dioClient
          .get("${DioClient.baseUrl}/products?limit=$limit&sort=$sort");
      if (response.statusCode == 200) {
        final data = response.data;
        List<Product> products =
            (data as List).map((e) => Product.fromJson(e)).toList();
        return products;
      }
      return [];
    } on DioError catch (er) {
      DioExceptions.fromDioError(er);
      return [];
    }
  }

  @override
  Future<SingleProduct?> singleProduct(String id) async {
    try {
      final response =
          await _dioClient.get("${DioClient.baseUrl}/products/$id");
      final data = SingleProduct.fromJson(response.data);
      if (response.statusCode == 200) {
        return data;
      }
      return null;
    } on DioError catch (er) {
      DioExceptions.fromDioError(er);
      return null;
    }
  }
}
