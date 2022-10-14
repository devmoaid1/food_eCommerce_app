import 'package:flutter/cupertino.dart';
import 'package:flutter_task_app/data/datasources/deals_datasource.dart';
import 'package:flutter_task_app/data/models/deal.dart';

abstract class DealsRepository {
  Future<List<Deal>> getAllDeals();
}

class DealsRepositoryImpl implements DealsRepository {
  final DealsDataSource dealsDataSource;

  DealsRepositoryImpl({required this.dealsDataSource});

  @override
  Future<List<Deal>> getAllDeals() async {
    try {
      final deals = await dealsDataSource.getAllDeals();
      return deals;
    } catch (err) {
      debugPrint(err.toString());
      return [];
    }
  }
}
