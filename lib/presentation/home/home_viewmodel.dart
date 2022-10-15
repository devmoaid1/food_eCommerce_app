// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_task_app/core/utilites/show_snackbar.dart';
import 'package:flutter_task_app/data/models/cart_item.dart';
import 'package:flutter_task_app/data/models/category.dart';
import 'package:flutter_task_app/data/models/offer.dart';
import 'package:flutter_task_app/data/models/product.dart';
import 'package:flutter_task_app/domain/controllers/cart_controller.dart';
import 'package:flutter_task_app/domain/controllers/favorites_controller.dart';
import 'package:flutter_task_app/domain/repositories/addresses_repository.dart';
import 'package:flutter_task_app/domain/repositories/categories_repository.dart';
import 'package:flutter_task_app/domain/repositories/deals_repository.dart';
import 'package:get/get.dart';

import '../../data/models/address.dart';
import '../../data/models/deal.dart';
import '../../domain/repositories/offer_repository.dart';

class HomeViewModel extends GetxController {
  final DealsRepository dealsRepository;
  final AddressRepository addressRepository;
  final OfferRepository offerRepository;
  final CategoriesRepository categoriesRepository;

  final CartController cartController;
  final FavoritesController favoritesController;

  HomeViewModel(
      {required this.dealsRepository,
      required this.addressRepository,
      required this.offerRepository,
      required this.categoriesRepository,
      required this.cartController,
      required this.favoritesController});
  List<Address> _addresses = [];
  List<Category> _categories = [];
  List<Deal> _deals = [];
  Offer? _currentOffer;
  RxBool _isLoading = true.obs;

  RxBool get isLoading => _isLoading;
  List<Address> get addresses => _addresses;
  List<Category> get categories => _categories;
  List<Deal> get currentDeals => _deals;
  Offer? get currentOffer => _currentOffer;

  void setLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getCurrentAddresses();
    getAllCategories();
    getCurrentDeals();
    getOffer();
    setLoading(false);
  }

  void getCurrentDeals() async {
    _deals = await dealsRepository.getAllDeals();
    update();
  }

  void getOffer() async {
    _currentOffer = await offerRepository.getOffer();
    update();
  }

  void getCurrentAddresses() async {
    _addresses = await addressRepository.getAllAddressess();
    update();
  }

  void getAllCategories() async {
    _categories = await categoriesRepository.getAllCategories();
    update();
  }

  void addItemToFavorites(Product product) {
    favoritesController.addToFavorites(product);

    update();
  }

  void removeItemFromFavorites(Product product) {
    favoritesController.removeFavorite(product);
    update();
  }

  void addToCart(Product product) {
    final cartItem = CartItem(
        product: product, quantity: 1, totalPrice: product.currentPrice);

    final isExistInCart = cartController.isItemExistInCart(cartItem);

    if (isExistInCart) {
      showCustomSnackBar(
          title: "info",
          color: Colors.green,
          message: "item already in cart",
          textColor: Colors.white);
    } else {
      cartController.addToCart(cartItem);
      showCustomSnackBar(
          title: "info",
          color: Colors.green,
          message: "Added item to cart",
          textColor: Colors.white);
    }

    update();
  }

  bool isItemInFavorites(Product product) {
    bool isExist = false;
    // check is item in favorites if favorites not empty
    if (favoritesController.favorites.isNotEmpty) {
      isExist = favoritesController.favorites.contains(product);
    }
    return isExist;
  }
}
