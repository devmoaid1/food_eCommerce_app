import 'package:flutter/cupertino.dart';

import 'package:flutter_task_app/data/models/product.dart';

import '../../data/datasources/offer_data_source.dart';
import '../../data/models/offer.dart';

abstract class OfferRepository {
  Future<Offer> getOffer();
}

class OfferRepositoryImpl implements OfferRepository {
  final OfferDataSource offerDataSource;

  OfferRepositoryImpl({required this.offerDataSource});

  @override
  Future<Offer> getOffer() async {
    try {
      final offer = await offerDataSource.getOffer();
      return offer;
    } catch (err) {
      debugPrint(err.toString());
      // in case error return mocked data
      return const Offer(
          product: Product(
              name: "test",
              currentPrice: 12,
              id: 10,
              imagePath: "",
              originalPrice: 20,
              stock: 10),
          dueDate: "20 Nov 2022");
    }
  }
}
