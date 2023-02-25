import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:omnipro_test/src/core/constants/constants.dart';

abstract class BaseDatasource {
  final String baseUrl = Endpoints.baseUrl;

  Future<bool> validateConnection() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      throw (Messages.noInternetConnection);
    }
    return connectivity != ConnectivityResult.none;
  }
}
