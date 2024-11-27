import 'package:flutter/material.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  static Future<dynamic> pushNamed(
    String routeName, {
    dynamic arguments,
  }) async {
    return navigatorkey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    return navigatorkey.currentState?.pop();
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    bool routePredicate = false,
    dynamic arguments,
  }) async {
    return navigatorkey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => routePredicate,
        arguments: arguments);
  }

  static Future<dynamic> popAndPushNamed(
    String routeName, {
    dynamic arguments,
  }) async {
    return navigatorkey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }
}
