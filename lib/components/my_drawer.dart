import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_list_title.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //drawer header and tiles
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              //shop tile
              MyListTile(
                text: 'Shop',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              MyListTile(
                text: 'Cart',
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cartpage');
                },
              ),
            ],
          ),

          // Exit button at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intropage', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
