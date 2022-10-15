import 'package:flutter_task_app/core/dataprovider/data_provider.dart';
import 'package:flutter_task_app/core/dataprovider/json_data_consumer.dart';
import 'package:flutter_task_app/data/datasources/addresses_datasource.dart';
import 'package:flutter_task_app/data/datasources/categories_datasource.dart';
import 'package:flutter_task_app/data/datasources/deals_datasource.dart';
import 'package:flutter_task_app/domain/controllers/cart_controller.dart';
import 'package:flutter_task_app/domain/controllers/favorites_controller.dart';
import 'package:flutter_task_app/presentation/cart/cart_viewmodel.dart';
import 'package:flutter_task_app/presentation/favorites/favorites_viewmodel.dart';
import 'package:flutter_task_app/presentation/home/home_viewmodel.dart';
import 'package:flutter_task_app/presentation/main_navigation/main_navigation_viewmodel.dart';
import 'package:get/get.dart';

import '../data/datasources/offer_data_source.dart';
import '../domain/repositories/addresses_repository.dart';
import '../domain/repositories/categories_repository.dart';
import '../domain/repositories/deals_repository.dart';
import '../domain/repositories/offer_repository.dart';

void setupLocator() {
  Get.lazyPut<DataProvider>(() => JsonDataConsumer());

  // datasources

  Get.lazyPut<DealsDataSource>(
      () => DealsDataSourceImpl(dataProvider: Get.find()));
  Get.lazyPut<CategoriesDataSource>(
      () => CategoriesDataSourceImpl(dataProvider: Get.find()));
  Get.lazyPut<AddressessDataSource>(
      () => AddressessDataSourceImpl(dataProvider: Get.find()));
  Get.lazyPut<OfferDataSource>(
      () => OfferDataSourceImpl(dataProvider: Get.find()));

  // repositories
  Get.lazyPut<DealsRepository>(
      () => DealsRepositoryImpl(dealsDataSource: Get.find()));
  Get.lazyPut<CategoriesRepository>(
      () => CategoriesRepositoryImpl(categoriesDataSource: Get.find()));
  Get.lazyPut<AddressRepository>(
      () => AddressRepositoryImpl(addressessDataSource: Get.find()));
  Get.lazyPut<OfferRepository>(
      () => OfferRepositoryImpl(offerDataSource: Get.find()));

  //controllers

  Get.lazyPut(() => CartController());
  Get.lazyPut(() => FavoritesController());

  //viewmodels
  Get.lazyPut(
      () => HomeViewModel(
          dealsRepository: Get.find(),
          addressRepository: Get.find(),
          offerRepository: Get.find(),
          categoriesRepository: Get.find(),
          cartController: Get.find(),
          favoritesController: Get.find()),
      fenix: true);

  Get.lazyPut(() => FavoritesViewModel(favoritesController: Get.find()),
      fenix: true);
  Get.lazyPut(() => CartViewModel(cartController: Get.find()), fenix: true);

  Get.lazyPut(() => MainNavigationViewModel());
}
