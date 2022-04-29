import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> {

  bool _isVisible = false;

  void _changeVisible(){
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _animatedPlaceHolder(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
        },
      ),
      body:  Column(
        children: [

        ],
      ),
    );
  }

  AnimatedCrossFade _animatedPlaceHolder() {
    return AnimatedCrossFade( // between two widgets
      firstChild: Placeholder(),
      secondChild: SizedBox.shrink(),
      duration: _DurationItems.durationLow,
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

extension BuildContextExtension on BuildContext{ // we can call everything on project with context

  TextTheme textTheme(){
    return Theme.of(this).textTheme;
  }
}

class _DurationItems{
  static const durationLow = Duration(seconds: 1);
}