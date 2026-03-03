import 'package:cart_all/model/products_model.dart';

class CartAllModel {
  final int? id;
  final List<ProductsModel>? products;
  final double? total;
  final double? discountedTotal;
  final int? userId;
  final int? totalProducts;
  final int? totalQuantity;

  CartAllModel({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  factory CartAllModel.fromJson(Map<String, dynamic> json) {
    return CartAllModel(
      id: json['id'],
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductsModel.fromJson(e))
          .toList(),
      total: (json['total'] as num).toDouble(),
      discountedTotal: (json['discountedTotal'] as num).toDouble(),
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }
}
