import 'package:flutter/material.dart';
import 'package:flutter_advanced/product/widget/button/answer_button.dart';
import 'package:flutter_advanced/product/widget/button/loading_button.dart';
import 'package:flutter_advanced/product/widget/callback_dropdown.dart';

class CallbackLearn extends StatefulWidget {
  const CallbackLearn({Key? key}) : super(key: key);

  @override
  State<CallbackLearn> createState() => _CallbackLearnState();
}

class _CallbackLearnState extends State<CallbackLearn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallbackDropDown(onSelectedUser: (CallbackUser user) {
            print(user);
          }),
          AnswerButton(onNumber: (number){
            return number % 3 == 1;
          },
          ),
          LoadingButton(title: 'Save', onPressed : () async{
            await Future.delayed(Duration(seconds: 1));
          })
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;
  CallbackUser(this.name, this.id);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CallbackUser && other.name == name && other.id == id;
  }

  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser('vlk', 1234),
      CallbackUser('vlkn', 12414),
    ];
  }
}
