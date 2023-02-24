import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:omnipro_test/src/core/di/app_component.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
  initializerName: r'$appInitGetIt',
)
void configureGetIt() => locator.$appInitGetIt();
