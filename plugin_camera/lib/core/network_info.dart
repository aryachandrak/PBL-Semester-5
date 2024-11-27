import 'dart:core';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:plugin_camera/main.dart';

abstract class NetworkInfoI {
  Future<bool> isConnected();
  Future<List<ConnectivityResult>> get connectivityResult;
  Stream<List<ConnectivityResult>> get connectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

  factory NetworkInfo() {
    return _networkInfo;
  }

  NetworkInfo._internal(this.connectivity);

  // Checks if the internet is connected
  // Returns [true] if connected, otherwise [false]
  @override
  Future<bool> isConnected() async {
    final result = await connectivityResult;
    return !result.contains(ConnectivityResult.none);
  }

  // To check the type of internet connectivity
  @override
  Future<List<ConnectivityResult>> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  // Checks the type of internet connection on changes of internet connection
  @override
  Stream<List<ConnectivityResult>> get connectivityChanged =>
      connectivity.onConnectivityChanged;
}

// Abstract class Failure
abstract class Failure {}
abstract class Exception {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

// Function to show an exception message
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!
          .showSnackBar(SnackBar(content: Text(message)));
    }
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}