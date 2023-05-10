import 'package:flutter/material.dart';
import 'package:flutter_food_app/controllers/cart_controller.dart';
import 'package:flutter_food_app/data/repository/popular_product_repo.dart';
import 'package:flutter_food_app/models/popular_products_model.dart';
import 'package:flutter_food_app/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  // ignore: non_constant_identifier_names
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        "Item count",
        "You can't add more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    //if exists
    //get from storage _inCartitems=3
    _cart = cart;
  }

  void addItem(
    ProductModel product,
  ) {
    if (quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      // _inCartItems=_cart.getQuantity(product);
      _cart.items.forEach((key, value) {});
    } else {
      Get.snackbar(
        "Item count",
        "You should atleast add an item in the cart",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
  }
}
