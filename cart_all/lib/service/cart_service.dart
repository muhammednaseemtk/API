import 'package:cart_all/model/cart_model.dart';
import 'package:dio/dio.dart';

class CartService {
  final Dio dio = Dio();

  Future<CartModel> fetchCart() async {
    final response = await dio.get('https://dummyjson.com/carts');

    try{
      if (response.statusCode == 200 && response.data != null) {
        return CartModel.fromJson(response.data);
      } else{
        throw Exception('Failed Load');
      }
    } catch (e){
      throw Exception('Error Cart ${e.toString()}');
    }
  }
}