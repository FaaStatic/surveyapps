import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  static final NetworkInfo _main = NetworkInfo._internal();

  factory NetworkInfo() {
    return _main;
  }

  NetworkInfo._internal();

  Future<bool> checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
