import 'dart:convert';

import '../../../home/data/model/product.dart';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    required this.id,
    required this.userId,
    required this.date,
    this.products,
  });

  final int id;
  final int userId;
  final String date;
  final List<ProductInCart>? products;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        userId: json["userId"],
        date: json["date"],
        products: json["products"] != null
            ? List<ProductInCart>.from(
                json["products"].map((x) => ProductInCart.fromJson(x)))
            : null,
      );
  //products: List<ProductInCart>.from(json["products"].map((x) => x)),

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date,
        "products": List<Product>.from(products!.map((x) => x)),
      };
}

class ProductInCart {
  final int productId;
  final int quantity;

  ProductInCart({
    required this.productId,
    required this.quantity,
  });

  factory ProductInCart.fromJson(Map<String, dynamic> json) {
    return ProductInCart(
        productId: json["productId"], quantity: json["quantity"] as int);
  }
}
