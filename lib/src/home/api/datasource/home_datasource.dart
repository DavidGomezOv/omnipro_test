import 'package:injectable/injectable.dart';

@lazySingleton
class HomeDataSource {
  @factoryMethod
  HomeDataSource.from();
}
