import 'package:cart/model/products_model.dart';

class CartModel {
  final int? id;
  final double? total;
  final double? discountedTotal;
  final int? userId;
  final int? totalProducts;
  final int? totalQuantity;
  final List<ProductsModel>? products;

  CartModel({
    this.id,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
    this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      total: (json['total'] as num).toDouble(),
      discountedTotal: (json['discountedTotal'] as num).toDouble(),
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductsModel.fromJson(e))
          .toList(),
    );
  }
}
