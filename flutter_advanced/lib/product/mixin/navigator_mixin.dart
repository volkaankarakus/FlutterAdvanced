import 'package:flutter/material.dart';
import 'package:flutter_advanced/product/navigator/navigator_manager_advanced.dart';

mixin NavigatorMixin<T extends StatefulWidget> on State<T>{
  NavigatorManagerAdvanced get router => NavigatorManagerAdvanced.instance;
}