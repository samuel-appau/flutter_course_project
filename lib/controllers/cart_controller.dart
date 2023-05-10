import 'package:flutter_food_app/data/repository/cart_repo.dart';
import 'package:flutter_food_app/models/cart_model.dart';
import 'package:flutter_food_app/models/popular_products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  // ignore: prefer_final_fields
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items=>_items;
  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id!)) {
      _items.update(
        product.id!,
        (value) {
          return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
          );
        },
      );
    } else {
      _items.putIfAbsent(
        product.id!,
        () {
          _items.forEach((key, value) {});

          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
          );
        },
      );
    }
  }
}
