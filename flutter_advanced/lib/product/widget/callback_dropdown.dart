import 'package:flutter/material.dart';
import 'package:flutter_advanced/303/callback_learn.dart';

class CallbackDropDown extends StatefulWidget {
  const CallbackDropDown({Key? key,required this.onSelectedUser}) : super(key: key);

  final void Function(CallbackUser user) onSelectedUser;

  @override
  State<CallbackDropDown> createState() => _CallbackDropDownState();
}

class _CallbackDropDownState extends State<CallbackDropDown> {
  CallbackUser? _user;

  void _updateUser(CallbackUser? callbackUser){
    setState(() {
      _user = callbackUser;
    });

    if(_user == null){
      widget.onSelectedUser.call(_user!);
    }

  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallbackUser>(
        value: _user,
        items: CallbackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
            child: Text(e.name,style: Theme.of(context).textTheme.headline3,),
            value: e,
          );
        }).toList(),
        onChanged: _updateUser,
        );
  }
}
