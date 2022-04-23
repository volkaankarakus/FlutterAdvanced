import 'package:flutter/material.dart';
import 'package:flutter_advanced/demos/color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({Key? key}) : super(key: key);

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {

  Color? _backgroundColor; // (nullable) may not be valued throughout the project

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ // right part
          IconButton(
              onPressed: _changeBackgroundWithOnPress,
              icon: Icon(Icons.clear))
        ],
      ),
      body: Column(
        children: [
          Spacer(), // 50%
          Expanded(child: ColorDemos(initialColor: _backgroundColor )),
        ],
      ),
    );
  }

  void _changeBackgroundWithOnPress(){
              setState(() {
                _backgroundColor = Colors.pink;
              });
            }
}
