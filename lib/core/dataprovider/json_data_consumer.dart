import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_task_app/core/dataprovider/data_provider.dart';

class JsonDataConsumer implements DataProvider {
  @override
  Future getData({required String path}) async {
    final response = await rootBundle.loadString(path);

    return json.decode(response);
  }
}
