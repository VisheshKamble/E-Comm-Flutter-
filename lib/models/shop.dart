import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';

class Shop extends ChangeNotifier {
  // list of products for sale
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 999,
      description: "Item Description",
      imagePath: 'assets/hoodie.png'
    ),
    Product(
      name: "Product 2",
      price: 1499,
      description: "Item description",
      imagePath: 'assets/watch.png' 
    ),
    Product(
      name: "Product 3",
      price: 1999,
      description: "Item description",
      imagePath: 'assets/hoodie.png'
    ),
    Product(
      name: "Product 4",
      price: 2499,
      description: "Item description",
      imagePath: 'assets/watch.png'
    ),
  ];

  // user cart
  final List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}