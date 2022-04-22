import 'package:flutter/material.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        maxLength: 40,
        buildCounter: (BuildContext context,
            {int? currentLength, bool? isFocused, int? maxLength}) {
          return _animatedContainer(currentLength);
        },
        keyboardType: TextInputType.emailAddress,
        autofillHints: [AutofillHints.email],
        style: TextStyle(color: Colors.blue),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail), // icon at left
          border: OutlineInputBorder(),
          labelText: 'Mail',
          fillColor: Colors.white,
        ),
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
          key: key,
          duration: Duration(seconds: 1),
          height: 10,
          width: 10.0 * (currentLength ?? 0),
          color: Colors.green,
        );
  }
}
