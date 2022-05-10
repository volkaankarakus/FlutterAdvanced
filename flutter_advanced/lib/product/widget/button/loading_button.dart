import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({Key? key,required this.title,required this.onPressed}) : super(key: key);
  final String title;
  final Future<void> Function() onPressed;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async{
          if(_isLoading) return;
          _changeLoading();
          await widget.onPressed.call();
          _changeLoading();
        },
        child: Center(_isLoading ? CircularProgressIndicator() : Text(widget.title)));
  }
}
