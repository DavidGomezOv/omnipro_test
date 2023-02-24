import 'package:flutter/cupertino.dart';
import 'package:omnipro_test/src/core/di/app_component.dart';
import 'package:omnipro_test/src/home/api/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final _homeRepository = locator<HomeRepository>();
}
