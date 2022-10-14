import 'package:flutter_task_app/core/dataprovider/data_provider.dart';
import 'package:flutter_task_app/core/dataprovider/json_paths.dart';

import '../models/product.dart';

abstract class ProductsDataSource {
  Future<List<Product>> getAllProducts();
}

class ProductsDataSourceImpl implements ProductsDataSource {
  final DataProvider dataProvider;

  ProductsDataSourceImpl({required this.dataProvider});

  @override
  Future<List<Product>> getAllProducts() async {
    final response = await dataProvider.getData(path: JsonPaths.productsPath);

    return response.map((data) => Product.fromJson(data)).toList();
  }
}
