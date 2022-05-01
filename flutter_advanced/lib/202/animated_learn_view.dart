import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: _DurationItems.durationLow);
  }

  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;


  void _changeVisible(){
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity(){
    setState(() {
      _isOpacity = !_isOpacity;
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
          controller.animateTo(_isVisible ? 1 : 0);
        },
      ),
      body:  Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                duration: _DurationItems.durationLow,
                opacity: _isOpacity ? 1 : 0,
                child: Text('data')),
            trailing: IconButton(
              onPressed: (){
                _changeOpacity();
              },
              icon: Icon(Icons.launch),
            ),
          ),
          AnimatedDefaultTextStyle(
              child: Text('data'),
              style: (_isVisible ? context.textTheme().headline1 : context.textTheme().subtitle1) ?? TextStyle(),
              duration: _DurationItems.durationLow),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
          ),
          AnimatedContainer(
            height: _isVisible ? 0 : MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.height * 0.2,
            duration: _DurationItems.durationLow,
            color: Colors.blue,
            margin: EdgeInsets.all(5.0),
          ),
          Expanded(
              child: Stack(
                children: [
                  AnimatedPositioned(
                      child: Text('data'),
                      duration: _DurationItems.durationLow)
                ],
              )),
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