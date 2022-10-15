import 'package:flutter_task_app/data/models/cart_item.dart';
import 'package:flutter_task_app/domain/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  final CartController cartController;
  List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  CartViewModel({required this.cartController});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCart();
  }

  void getCart() {
    _cart = cartController.cartItems.value;
    update();
  }

  void incrementQuantity(CartItem cartItem) {
    cartController.incrementQuantity(cartItem);
    update();
  }

  void decrementQuantity(CartItem cartItem) {
    cartController.decrementQuantity(cartItem);
    update();
  }

  void removefromCart(CartItem cartItem) {
    cartController.removeFromCart(cartItem);
    update();
  }
}
