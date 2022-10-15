import 'package:get/get.dart';

import '../../data/models/cart_item.dart';

class CartController extends GetxController {
  final RxList<CartItem> _cartItems = <CartItem>[].obs;

  final RxDouble _subTotal = 0.0.obs;

  RxList<CartItem> get cartItems => _cartItems;

  RxDouble get subTotal => _subTotal;

  void addToCart(CartItem cartItem) {
    _cartItems.add(cartItem);
    _subTotal.value += cartItem.totalPrice!;
    update();
  }

  void removeFromCart(CartItem cartItem) {
    _cartItems.remove(cartItem);
    _subTotal.value -= cartItem.totalPrice!;
    update();
  }

  void incrementQuantity(CartItem cartItem) {
    cartItem.quantity = cartItem.quantity! + 1;
    cartItem.totalPrice =
        cartItem.totalPrice! + cartItem.product!.currentPrice!;

    _subTotal.value += cartItem.product!.currentPrice!;

    update();
  }

  void decrementQuantity(CartItem cartItem) {
    if (cartItem.quantity! > 1) {
      cartItem.quantity = cartItem.quantity! - 1;
      cartItem.totalPrice =
          cartItem.totalPrice! - cartItem.product!.currentPrice!;

      _subTotal.value -= cartItem.product!.currentPrice!;
    }

    update();
  }

  bool isItemExistInCart(CartItem cartItem) {
    bool isExist = false;

    for (var element in _cartItems.value) {
      if (cartItem.product!.id == element.product!.id) {
        isExist = true;
      }
    }

    return isExist;
  }

  void calculateSubTotal() {
    _subTotal.value = 0;

    for (var element in _cartItems.value) {
      _subTotal.value += element.totalPrice!;
    }

    update();
  }
}
