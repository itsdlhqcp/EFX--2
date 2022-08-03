import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class CartModelProvider with ChangeNotifier {
  Map<String, CartProductModel> cartModelProvider = {};
  double addAmount() {
    var total = 0.00;

    cartModelProvider.forEach((key, value) {
      total = value.price * value.quantity;
    });
    return total;
  }
// Add products into Cart

  addProductToCart(
      {required String imageUrl,
      required String title,
      required double price}) {
    if (cartModelProvider.containsKey(title)) {
      cartModelProvider.update(
          title,
          (value) => CartProductModel(
              quantity: value.quantity + 1,
              title: value.title,
              image: value.image,
              price: value.price));
    } else {
      cartModelProvider.putIfAbsent(
          title,
          () => CartProductModel(
              title: title, quantity: 1, image: imageUrl, price: price));
    }
    notifyListeners();
  }

// Remove products from Cart

  reduceProductToCart(
      {required String title, required String image, required double price}) {
    if (cartModelProvider.containsKey(title)) {
      cartModelProvider.update(
          title,
          (value) => CartProductModel(
              quantity: value.quantity - 1,
              title: value.title,
              image: value.image,
              price: value.price));
    } else {
      cartModelProvider.putIfAbsent(
          title,
          () => CartProductModel(
              quantity: 1, title: title, image: image, price: price));
    }
    notifyListeners();
  }
// Delete selected product from Cart

  removeCartItems({required String title}) {
    cartModelProvider.remove(title);
    notifyListeners();
  }

// Delete all products from Cart

  clearCartData() {
    cartModelProvider.clear();
    notifyListeners();
  }
}
