import 'package:flutter/material.dart';

class NavigateDetailLearn extends StatefulWidget {
  const NavigateDetailLearn({Key? key,this.isOK = false}) : super(key: key);
  final bool isOK;

  @override
  State<NavigateDetailLearn> createState() => _NavigateDetailLearnState();
}

class _NavigateDetailLearnState extends State<NavigateDetailLearn> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: (){
              Navigator.of(context).pop(!widget.isOK);
            },
            icon: Icon(Icons.check,color: widget.isOK ? Colors.red : Colors.green),
            label: widget.isOK ? Text('Dismiss') : Text('OK'),
        )
      ),
    );
  }
}
