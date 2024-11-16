import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_ecommerce_app/components/my_button.dart';
import 'package:minimal_ecommerce_app/models/product.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
//remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from your cart?'),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          // yes button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text('yes'),
          ),
        ],
      ),
    );
  }

//user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                  'User wants to pay! Connect your app to your payment backend'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Cart Page',
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text('Your cart is empty'),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item in cart
                      final item = cart[index];

                      //return as a cart title UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('\$' + item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: const Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
          ),
          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text('Pay now')),
          )
        ],
      ),
    );
  }
}
