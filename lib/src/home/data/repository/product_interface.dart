import '../model/product.dart';
import '../model/single_product.dart';

abstract class ProductInterface {
  Future<List<Product>> getAllProducts({int? limit, String? sort});
  Future<SingleProduct?> singleProduct(String id);
}
