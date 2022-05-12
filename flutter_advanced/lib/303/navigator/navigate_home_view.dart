import 'package:flutter/material.dart';
import 'package:flutter_advanced/product/mixin/navigator_mixin.dart';
import 'package:flutter_advanced/product/navigator/navigator_manager_advanced.dart';
import 'package:flutter_advanced/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({Key? key}) : super(key: key);

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> with NavigatorMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
          onPressed: () async{
            router.pushToPage(NavigateRoutes.detail,arguments: 'vk20');
            // await NavigatorManagerAdvanced.instance.pushToPage(NavigateRoutes.detail,arguments: 'vk20');
            // Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf,arguments: "fsdfsdfsfdsf",);
          },child: Icon(Icons.abc_rounded),
      ),
      appBar: AppBar(),
    );
  }
}

