import 'package:flutter_task_app/domain/controllers/favorites_controller.dart';
import 'package:get/get.dart';

import '../../data/models/product.dart';

class FavoritesViewModel extends GetxController {
  final FavoritesController favoritesController;
  List<Product> _favorites = [];

  FavoritesViewModel({required this.favoritesController});

  List<Product> get favorites => _favorites;

  @override
  void onInit() {
    super.onInit();
    getFavorites();
  }

  void getFavorites() {
    _favorites = favoritesController.favorites;
    update();
  }
}
