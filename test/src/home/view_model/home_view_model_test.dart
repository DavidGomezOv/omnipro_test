import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:omnipro_test/src/home/api/repository/home_repository.dart';
import 'package:omnipro_test/src/home/view_model/home_view_model.dart';

import '../../core/di/app_component_testing.dart';
import '../../core/mocks.dart';

void main() {
  late HomeViewModel viewModel;

  setUp(() {
    initTesterLocator();
    viewModel = HomeViewModel();
  });

  tearDown(() {
    resetTesterLocator();
  });

  group('test in home_repository.dart', () {
    test(
      'getItems() should call getItems() method in repository',
      () async {
        await viewModel.getItems();
        verify(testerLocator<HomeRepository>().getItems()).called(2);
      },
    );

    test(
      'getItems() should change value of loading variable before and after call the method',
      () async {
        expect(viewModel.loading, false);
        viewModel.getItems().then((value) {
          expect(viewModel.loading, false);
        });
        expect(viewModel.loading, true);
      },
    );

    test(
      'getItems() should fill totalItems variable with a list of ItemModel objects after call the method',
      () async {
        await viewModel.getItems();
        expect(viewModel.totalItems, testGetItemsResults);
      },
    );
  });
}
