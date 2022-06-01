import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/product/global/theme_notifier.dart';
import 'package:flutter_advanced/product/init/localization_init.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProductInit{
  final LocalizationInit localizationInit = LocalizationInit();
  final List<SingleChildWidget> providers = [
    Provider(create:(_) => ResourceContext()),
    ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())
  ];

  Future<void> init() async{
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}

// TERMINAL FOR en-US.json
// flutter pub run easy_localization:generate -O lib/product/init/lang -f keys  -o locale_keys.g.dart --source-dir assets/translations