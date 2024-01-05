import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_info.g.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImpl(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}

@Riverpod(keepAlive: true)
NetworkInfoImpl networkInfo(NetworkInfoRef ref) {
  final internetConnectionChecker = InternetConnectionChecker();
  return NetworkInfoImpl(internetConnectionChecker);
}
