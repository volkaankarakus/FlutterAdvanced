import 'package:flutter/material.dart';
import 'package:flutter_advanced/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({Key? key}) : super(key: key);

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
          onPressed: (){
            Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf,
            arguments: "fsdfsdfsfdsf",
            );
          },child: Icon(Icons.abc_rounded),
      ),
      appBar: AppBar(),
    );
  }
}
