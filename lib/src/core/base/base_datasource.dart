import 'package:connectivity_plus/connectivity_plus.dart';

abstract class BaseDatasource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<bool> validateConnection() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      throw ('The device is not connected to Internet');
    }
    return connectivity != ConnectivityResult.none;
  }
}
