import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
//products for sale
//product 1
    Product(
        name: 'Champion Sports Pro-Style Basketball ',
        price: 99.9,
        description: 'item description',
        imagePath: 'assets/ball.png'),
    //product 2
    Product(
        name: 'Jordans white/black',
        price: 25.9,
        description: 'item description',
        imagePath: 'assets/basketball.png'), //product 3
    Product(
        name: 'Jordans red/yellow',
        price: 33.9,
        description: 'item description',
        imagePath: 'assets/shoe.png'), //product 4
    Product(
        name: 'Converse ',
        price: 44.9,
        description: 'item description',
        imagePath: 'assets/sneakers.png'),
  ];
  //user cart
  List<Product> _cart = [];
  //get product list
  List<Product> get shop => _shop;
//get user cart
  List<Product> get cart => _cart;
//add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

//remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
