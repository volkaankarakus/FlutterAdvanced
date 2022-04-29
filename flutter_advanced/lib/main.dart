import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/101/custom_widget_learn.dart';
import 'package:flutter_advanced/101/list_view_learn.dart';
import 'package:flutter_advanced/101/navigation_learn.dart';
import 'package:flutter_advanced/101/text_field_learn.dart';
import 'package:flutter_advanced/202/model_learn_view.dart';
import 'package:flutter_advanced/202/package_learn_view.dart';
import 'package:flutter_advanced/202/service/service_get_learn_view.dart';
import 'package:flutter_advanced/202/service/service_post_learn_view.dart';
import 'package:flutter_advanced/202/tab_learn.dart';
import 'package:flutter_advanced/demos/color_demos_view.dart';
import 'package:flutter_advanced/demos/color_lifecycle_view.dart';
import 'package:flutter_advanced/demos/my_collection_demos.dart';
import 'package:flutter_advanced/demos/note_demos_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:

      ThemeData.dark().copyWith(
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          // indicatorSize: TabBarIndicatorSize.label,
        ),

        bottomAppBarTheme: BottomAppBarTheme(
          shape: CircularNotchedRectangle(),
        ),

          progressIndicatorTheme:
              ProgressIndicatorThemeData(color: Colors.white),

          listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),

          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            iconColor: Colors.red,
            border: OutlineInputBorder(),
          ),

          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))
          ),

          appBarTheme: AppBarTheme(
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.transparent,
              elevation: 0)),

      home: PackageLearnView(),
    );
  }
}
