import 'package:flutter/material.dart';
import 'package:flutter_advanced/101/list_view_learn.dart';
import 'package:flutter_advanced/101/navigate_detail_learn.dart';
import 'package:flutter_advanced/101/page_view_learn.dart';
import 'package:flutter_advanced/demos/my_collection_demos.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn>
    with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Placeholder();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigation_rounded),
        onPressed: () async{
          final response = await navigateToWidgetNormal<bool>(context, NavigateDetailLearn());

          if(response == true){

          }
        },
      ),
    );
  }
}

mixin NavigatorManager {
  // mixin -> class without constructor
  void navigateToWidget(BuildContext context, Widget widget) {
    // we need context and going to go widget

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
      fullscreenDialog:
          true, // it gives bottom-up animation on new page opening
      // and it gives X icon instead of left icon on top
      settings: RouteSettings(),
    ));
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    // push returns a generic. it means data can come from other pages and you can fetch it.
      // we can fetch it with return.

    return Navigator.of(context).push<T>(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
      fullscreenDialog:
      true, // it gives bottom-up animation on new page opening
      // and it gives X icon instead of left icon on top
      settings: RouteSettings(),
    ));
  }
}
