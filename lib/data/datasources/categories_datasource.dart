import 'package:flutter_task_app/data/models/category.dart';

import '../../core/dataprovider/data_provider.dart';
import '../../core/dataprovider/json_paths.dart';

abstract class CategoriesDataSource {
  Future<List<Category>> getAllCategories();
}

class CategoriesDataSourceImpl implements CategoriesDataSource {
  final DataProvider dataProvider;

  CategoriesDataSourceImpl({required this.dataProvider});

  @override
  Future<List<Category>> getAllCategories() async {
    List<Category> categories = [];
    final response = await dataProvider.getData(path: JsonPaths.categoriesPath);

    response.forEach((data) => categories.add(Category.fromJson(data)));

    return categories;
  }
}
