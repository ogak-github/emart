import '../model/product.dart';
import '../model/single_product.dart';

abstract class ProductDatasource {
  Future<List<Product>> getAllProducts({int? limit, String? sort});
  Future<SingleProduct?> singleProduct(String id);
  Future<List<String>> allCategories();
}