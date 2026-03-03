import 'package:cart_all/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartAllScreen extends StatelessWidget {
  const CartAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Carts'),
        centerTitle: true,
      ),
      body: Consumer<CartController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.cartAll == null || controller.carts.isEmpty) {
            return const Center(child: Text('Not found'));
          }

          return ListView.builder(
            itemCount: controller.carts.length,
            itemBuilder: (context, index) {
              final cart = controller.carts[index];

              return Card(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        'Cart ID: ${cart.id}',
                        style:  TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Total Products: ${cart.products?.length ?? 0}'),
                      Text('Total Amount: ₹${cart.total}'),

                       Divider(),

                      ...?cart.products?.map((product) {
                        return ListTile(
                          leading: Image.network(
                            product.thumbnail ?? '',
                            width: 40,
                            height: 40,
                          ),
                          title: Text(product.title ?? ''),
                          subtitle: Text(
                            'Qty: ${product.quantity} | ₹${product.discountedTotal}',
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}