import 'package:injectable/injectable.dart';
import 'package:omnipro_test/src/home/api/datasource/home_datasource.dart';
import 'package:omnipro_test/src/home/model/item_model.dart';

@injectable
class HomeRepository {
  final HomeDataSource _dataSource;

  @factoryMethod
  HomeRepository.from(this._dataSource);

  Future<List<ItemModel>> getItems() {
    return _dataSource.getItems();
  }
}
