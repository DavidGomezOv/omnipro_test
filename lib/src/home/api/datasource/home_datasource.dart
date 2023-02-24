import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:omnipro_test/src/core/base/base_datasource.dart';
import 'package:omnipro_test/src/home/model/item_model.dart';

@lazySingleton
class HomeDataSource extends BaseDatasource {
  @factoryMethod
  HomeDataSource.from();

  Future<List<ItemModel>> getItems() async {
    List<ItemModel> items = [];
    await validateConnection();
    final response = await http
        .get(Uri.parse(baseUrl))
        .timeout(const Duration(seconds: 30))
        .onError((error, _) => throw (error.toString()));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      for (final data in json) {
        items.add(ItemModel.fromJson(data));
      }
      return items;
    } else {
      throw ('status code ${response.statusCode}');
    }
  }
}
