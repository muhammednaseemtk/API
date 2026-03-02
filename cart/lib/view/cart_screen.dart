import 'package:cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen'),
        centerTitle: true,
      ),

      body: Consumer<CartController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator(),);
          }

          if (controller.cart == null) {
            return Center(child: Text('No Data'),);
          }

          return ListView.builder(
            itemCount: controller.cart!.products!.length,
            itemBuilder: (context, index) {
              final product = controller.cart!.products![index];

              return Card(
                child: Column(
                  children: [
                    Image.network(product.thumbnail ?? ''),
                    SizedBox(height: 10,),
                    Text(product.title ?? ''),
                    SizedBox(height: 10,),
                    Text('${product.price ?? ''}'),
                    Text('${product.quantity ?? ''}')
                  ],
                ),
              );
            },
            );
        },
        ),
    );
  }
}