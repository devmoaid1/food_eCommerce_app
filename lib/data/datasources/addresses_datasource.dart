import 'package:flutter_task_app/data/models/address.dart';

import '../../core/dataprovider/data_provider.dart';
import '../../core/dataprovider/json_paths.dart';

abstract class AddressessDataSource {
  Future<List<Address>> getAllAddressess();
}

class AddressessDataSourceImpl implements AddressessDataSource {
  final DataProvider dataProvider;

  AddressessDataSourceImpl({required this.dataProvider});

  @override
  Future<List<Address>> getAllAddressess() async {
    List<Address> addresses = [];
    final response = await dataProvider.getData(path: JsonPaths.addressPath);

    response.forEach((data) {
      addresses.add(Address.fromTitleStreetFloorType(data));
    });

    return addresses;

    // return response.map((data) => Address.fromJson(data)).toList();
  }
}
