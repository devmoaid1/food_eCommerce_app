import 'package:flutter_task_app/data/models/deal.dart';

import '../../core/dataprovider/data_provider.dart';
import '../../core/dataprovider/json_paths.dart';

abstract class DealsDataSource {
  Future<List<Deal>> getAllDeals();
}

class DealsDataSourceImpl implements DealsDataSource {
  final DataProvider dataProvider;

  DealsDataSourceImpl({required this.dataProvider});

  @override
  Future<List<Deal>> getAllDeals() async {
    List<Deal> deals = [];
    final response = await dataProvider.getData(path: JsonPaths.dealsPath);

    response.forEach((data) => deals.add(Deal.fromJson(data)));

    return deals;
  }
}
