import 'package:flutter/material.dart';
import 'package:omnipro_test/src/core/di/app_component.dart';
import 'package:omnipro_test/src/core/navigation/routes.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureGetIt();
  runApp(const MyApp());
}

final appNavigatorKey = StackedService.navigatorKey;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chopper App Demo',
      initialRoute: Routes.home,
      navigatorKey: appNavigatorKey,
      routes: Routes.routes,
    );
  }
}
