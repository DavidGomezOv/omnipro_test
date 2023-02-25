import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omnipro_test/src/home/api/repository/home_repository.dart';
import 'package:omnipro_test/src/home/model/item_model.dart';

import '../../../core/mocks.dart';
import '../../../core/mocks.mocks.dart';

void main() {
  late HomeRepository repository;
  late MockHomeDataSource dataSource;

  setUp(() {
    dataSource = mockHomeDataSource;
    repository = HomeRepository.from(dataSource);
  });

  group('test in home_repository.dart', () {
    test(
      'getItems() should call getItems() method in datasource and return an object of type List of ItemModel',
      () async {
        when(dataSource.getItems()).thenAnswer(
          (_) async => testGetItemsResults,
        );
        final result = await repository.getItems();
        verify(dataSource.getItems()).called(1);
        expect(result.runtimeType, List<ItemModel>);
      },
    );

    test(
      'getItems() should return a List of ItemModel objects',
      () async {
        when(dataSource.getItems()).thenAnswer(
          (_) async => testGetItemsResults,
        );
        final result = await repository.getItems();
        expect(result, testGetItemsResults);
      },
    );

    test(
      'getItems() should return an empty list',
      () async {
        when(dataSource.getItems()).thenAnswer(
          (_) async => [],
        );
        final result = await repository.getItems();
        expect(result, isEmpty);
      },
    );

    test(
      'getItems() should throw an Exception with "No internet connection" message',
      () async {
        const errorMessage = 'No internet connection';
        try {
          when(dataSource.getItems()).thenAnswer(
            (_) async => throw (errorMessage),
          );
          await repository.getItems();
        } catch (exception) {
          expect(exception.toString(), errorMessage);
        }
      },
    );

    test(
      'getItems() should throw an Exception with status code 500',
      () async {
        const errorMessage = 'status code ${500}';
        try {
          when(dataSource.getItems()).thenAnswer(
            (_) async => throw (errorMessage),
          );
          await repository.getItems();
        } catch (exception) {
          expect(exception.toString(), errorMessage);
        }
      },
    );
  });
}
