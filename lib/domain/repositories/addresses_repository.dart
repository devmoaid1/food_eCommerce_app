import 'package:flutter/cupertino.dart';
import 'package:flutter_task_app/data/datasources/addresses_datasource.dart';
import 'package:flutter_task_app/data/models/address.dart';

abstract class AddressRepository {
  Future<List<Address>> getAllAddressess();
}

class AddressRepositoryImpl implements AddressRepository {
  final AddressessDataSource addressessDataSource;

  AddressRepositoryImpl({required this.addressessDataSource});

  @override
  Future<List<Address>> getAllAddressess() async {
    try {
      final addresses = await addressessDataSource.getAllAddressess();
      return addresses;
    } catch (err) {
      debugPrint(err.toString());
      return [];
    }
  }
}
