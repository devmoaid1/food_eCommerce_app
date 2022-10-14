import 'package:get/get.dart';

import '../../data/models/cart_item.dart';

class CartController extends GetxController {
  final RxList<CartItem> _cartItems = [].obs as RxList<CartItem>;

  final RxDouble _subTotal = 0.0.obs;

  RxList<CartItem> get cartItems => _cartItems;

  RxDouble get subTotal => _subTotal;
}
