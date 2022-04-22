import 'package:flutter/material.dart';

class StatefulLifeCycleLearn extends StatefulWidget {
  const StatefulLifeCycleLearn({Key? key,required this.message}) : super(key: key);
  final String message;

  @override
  State<StatefulLifeCycleLearn> createState() => _StatefulLifeCycleLearnState();
}

class _StatefulLifeCycleLearnState extends State<StatefulLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd; // assigned at constructor time -> late final



  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;

    _decideOddEven();
  }

  @override
  void dispose() {
    super.dispose();
    _message = '';
  }

  void _decideOddEven() {
    _isOdd ? _message +='ODD' : _message +='EVEN';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isOdd
        ? TextButton(onPressed: () {}, child:Text(_message))
        : ElevatedButton(onPressed: (){}, child:Text(_message)),
      ),
    );
  }
}
