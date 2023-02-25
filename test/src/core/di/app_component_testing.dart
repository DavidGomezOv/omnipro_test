import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:omnipro_test/src/home/api/repository/home_repository.dart';

import '../mocks.dart';
import '../mocks.mocks.dart';

final GetIt testerLocator = GetIt.instance;

void initTesterLocator() {
  testerLocator
      .registerLazySingleton<HomeRepository>(() => MockHomeRepository());

  initMockStubs();
}

void resetTesterLocator() {
  testerLocator.reset();
}

void initMockStubs() {
  when(testerLocator<HomeRepository>().getItems())
      .thenAnswer((_) => Future.value(testGetItemsResults));
}
