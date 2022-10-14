import 'package:flutter_task_app/data/models/offer.dart';

import '../../core/dataprovider/data_provider.dart';
import '../../core/dataprovider/json_paths.dart';

abstract class OfferDataSource {
  Future<Offer> getOffer();
}

class OfferDataSourceImpl implements OfferDataSource {
  final DataProvider dataProvider;

  OfferDataSourceImpl({required this.dataProvider});

  @override
  Future<Offer> getOffer() async {
    final response = await dataProvider.getData(path: JsonPaths.offerPath);

    return Offer.fromJson(response);
  }
}
