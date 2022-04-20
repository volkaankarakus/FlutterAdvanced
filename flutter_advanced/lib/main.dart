import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/101/custom_widget_learn.dart';
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
      theme: ThemeData.dark().copyWith(
          progressIndicatorTheme:
              ProgressIndicatorThemeData(color: Colors.white),
          listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          appBarTheme: AppBarTheme(
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.transparent,
              elevation: 0)),
      home: CustomWidgetLearn(),
    );
  }
}
