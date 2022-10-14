import 'package:flutter_task_app/data/models/category.dart';
import 'package:flutter_task_app/data/models/offer.dart';
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

  HomeViewModel(
      {required this.dealsRepository,
      required this.addressRepository,
      required this.offerRepository,
      required this.categoriesRepository});
  List<Address> _addresses = [];
  List<Category> _categories = [];
  List<Deal> _deals = [];
  Offer? _currentOffer;

  List<Address> get addresses => _addresses;
  List<Category> get categories => _categories;
  List<Deal> get currentDeals => _deals;
  Offer get currentOffer => _currentOffer!;

  @override
  void onInit() {
    super.onInit();
    getCurrentAddresses();
    getAllCategories();
    getCurrentDeals();
    getOffer();
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
}
