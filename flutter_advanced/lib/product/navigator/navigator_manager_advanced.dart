import 'package:flutter/material.dart';
import 'package:flutter_advanced/product/navigator/navigator_routes.dart';

class NavigatorManagerAdvanced{
  // not everyone can use it and it should not be produced every time(DO IT SINGLETON)
  NavigatorManagerAdvanced._();
  static NavigatorManagerAdvanced instance = NavigatorManagerAdvanced._();

  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey(); // do not want every user to be able to access it.

  // Let's return it to the user as a getter function
  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage(NavigateRoutes route,{Object? arguments}) async{
    await _navigatorGlobalKey.currentState?.pushNamed(route.withParaf,
        arguments : arguments);
  }
}