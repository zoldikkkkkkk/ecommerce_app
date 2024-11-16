import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_ecommerce_app/components/my_drawer.dart';
import 'package:minimal_ecommerce_app/components/my_product_tile.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //  access products in shop

    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            'Shop Page',
            style:
                TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cartpage'),
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop title
            Center(
                child: Text(
              'Pick from a selected list of premium products',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface),
            )),

            //shop subtitle

            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
