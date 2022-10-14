import 'package:flutter_task_app/data/models/product.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final RxList<Product> _favorites = <Product>[].obs;

  RxList<Product> get favorites => _favorites;

  void addToFavorites(Product product) {
    _favorites.add(product);
    update();
  }

  void removeFavorite(Product product) {
    _favorites.remove(product);
    update();
  }
}
