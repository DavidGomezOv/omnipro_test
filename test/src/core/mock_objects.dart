part of 'mocks.dart';

final testGetItemsResults =
    mockJsonItemResponse.map((json) => ItemModel.fromJson(json)).toList();
