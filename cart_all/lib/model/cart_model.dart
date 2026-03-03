import 'package:cart_all/model/cart_all_model.dart';

class CartModel {
  final List<CartAllModel>? carts;
  final int? total;
  final int? skip;
  final int? limit;

  CartModel({this.carts, this.total, this.skip, this.limit});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      carts: (json['carts'] as List<dynamic>?)
          ?.map((e) => CartAllModel.fromJson(e))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
