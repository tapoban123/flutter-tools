import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MobileDataIntercepter implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    final isMobile = connectivityResult.contains(ConnectivityResult.mobile);

    final isLarge = chain.request.url
        .toString()
        .contains(RegExp(r"(/large|/video|/posts)"));

    if (isMobile && isLarge) {
      throw MobileDataCostException();
    }

    return chain.proceed(chain.request); 
  }
}

class MobileDataCostException implements Exception {
  final message =
      "Downloading large files on mobile data connection may incur costs.";

  @override
  String toString() {
    return message;
  }
}
