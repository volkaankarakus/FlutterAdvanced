import 'package:flutter/material.dart';
import 'package:flutter_advanced/202/form_learn_view.dart';
import 'package:flutter_advanced/303/navigator/navigate_home_detail.dart';
import 'package:flutter_advanced/303/navigator/navigate_home_view.dart';
import 'package:flutter_advanced/303/part/feed_view.dart';
import 'package:flutter_advanced/main.dart';
import 'package:flutter_advanced/product/navigator/navigator_routes.dart';

mixin NavigatorCustom<T extends MyApp> on Widget{

  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings){
    if(routeSettings.name?.isEmpty ?? true){
      return _navigateToNormal(FormLearnView()); // its for 404 Not Found Page
    }

    final _routes = routeSettings.name == NavigatorRoutes.paraf
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(
            routeSettings.name!.substring(1)); // if it starts with "/"
                                                       // clean it.

    switch(_routes){
      case NavigateRoutes.init:
        return _navigateToNormal(FormLearnView());
      case NavigateRoutes.home:
        return _navigateToNormal(NavigateHomeView());
      case NavigateRoutes.detail:
        final _id = routeSettings.arguments;
        return _navigateToNormal(
            NavigateHomeDetail(id: _id is String ? _id : null),
          isFullScreenDialog: true,
        );
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child,{bool? isFullScreenDialog}){
    return MaterialPageRoute(
        fullscreenDialog: isFullScreenDialog ?? false,
        builder: (context){
          return child;
        });
  }
}