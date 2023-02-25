import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:omnipro_test/src/home/api/datasource/home_datasource.dart';
import 'package:omnipro_test/src/home/api/repository/home_repository.dart';
import 'package:omnipro_test/src/home/model/item_model.dart';

import 'mocks.mocks.dart';

part 'mock_json.dart';

part 'mock_objects.dart';

@GenerateNiceMocks([
  MockSpec<HomeRepository>(),
  MockSpec<HomeDataSource>(),
])
final mockHomeRepository = MockHomeRepository();
final mockHomeDataSource = MockHomeDataSource();
