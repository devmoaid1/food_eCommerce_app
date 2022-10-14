import 'package:flutter/cupertino.dart';
import 'package:flutter_task_app/data/datasources/categories_datasource.dart';
import 'package:flutter_task_app/data/models/category.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getAllCategories();
}

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesDataSource categoriesDataSource;

  CategoriesRepositoryImpl({required this.categoriesDataSource});

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      final categories = await categoriesDataSource.getAllCategories();
      return categories;
    } catch (err) {
      debugPrint(err.toString());
      return [];
    }
  }
}
