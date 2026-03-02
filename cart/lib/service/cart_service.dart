import 'package:cart/model/cart_model.dart';
import 'package:dio/dio.dart';

class CartService {
  final Dio dio = Dio();
  
  Future<CartModel> fetchData() async {
    try{
      final responce = await dio.get('https://dummyjson.com/carts/1');

      if (responce.statusCode == 200 && responce.data != null) {
        return CartModel.fromJson(responce.data);
      } else {
        throw Exception('Failed to load cart');
      }
    }catch (e) {
      throw Exception('erro fetch cart: $e');
    }
  }
}