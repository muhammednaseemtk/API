import 'package:cart/model/cart_model.dart';
import 'package:cart/service/cart_service.dart';
import 'package:flutter/widgets.dart';

class CartController extends ChangeNotifier {
  final CartService service = CartService();

  CartModel? cart;
  bool isLoading = false;
  String? error;

  CartController() {
    fetchCart();
  }

  Future<void> fetchCart() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try{
      cart = await service.fetchData();
    }catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}