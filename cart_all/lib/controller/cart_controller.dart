import 'package:cart_all/model/cart_all_model.dart';
import 'package:cart_all/model/cart_model.dart';
import 'package:cart_all/service/cart_service.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final CartService service = CartService();

  CartModel? cartAll;
  bool isLoading = false;
  String? error;

  Future<void> fetch() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      cartAll = await service.fetchCart();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<CartAllModel> get carts => cartAll?.carts ?? [];
}