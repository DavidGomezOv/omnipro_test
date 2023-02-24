import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omnipro_test/src/core/di/app_component.dart';
import 'package:omnipro_test/src/home/api/repository/home_repository.dart';
import 'package:omnipro_test/src/home/model/item_model.dart';

class HomeViewModel extends ChangeNotifier {
  final _homeRepository = locator<HomeRepository>();

  final ScrollController scrollController = ScrollController();

  List<ItemModel> items = [];
  List<ItemModel> totalItems = [];
  int listItemCount = 0;
  bool loading = false;
  String errorMessage = '';

  BuildContext context;

  HomeViewModel(this.context) {
    getItems();
    scrollController.addListener(pagination);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> getItems() async {
    errorMessage = '';
    loading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _homeRepository.getItems().then((value) {
      totalItems = value;
      listItemCount = 10;
      for (int i = 0; i < listItemCount; i++) {
        items.add(totalItems[i]);
      }
      notifyListeners();
    }).catchError((error) {
      errorMessage = error.toString();
      notifyListeners();
    }).whenComplete(() => loading = false);
  }

  void pagination() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (listItemCount + 10 >= totalItems.length) {
        listItemCount += totalItems.length - listItemCount;
      } else {
        listItemCount += 10;
      }
      for (int i = items.length; i < listItemCount; i++) {
        items.add(totalItems[i]);
      }
      notifyListeners();
    }
  }
}
