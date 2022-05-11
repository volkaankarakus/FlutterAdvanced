import 'package:flutter_advanced/303/navigator/navigate_home_detail.dart';
import 'package:flutter_advanced/303/navigator/navigate_home_view.dart';
import 'package:flutter_advanced/303/part/feed_view.dart';

class NavigatorRoutes{
  static const paraf = "/";

  final items = {
    paraf : (context) => FeedView(), // initial page (splash)
    NavigateRoutes.home.withParaf : (context) => NavigateHomeView(),
    NavigateRoutes.detail.withParaf : (context) => NavigateHomeDetail(),
  };
}

enum NavigateRoutes{init,home,detail}

extension NavigateRoutesExtension on NavigateRoutes{
  String get withParaf => "/$name";
}