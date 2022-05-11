import 'package:flutter/material.dart';

class NavigateHomeDetail extends StatefulWidget {
  const NavigateHomeDetail({Key? key,this.id}) : super(key: key);
  final String? id; // maybe data cannot come here.

  @override
  State<NavigateHomeDetail> createState() => _NavigateHomeDetailState();
}

class _NavigateHomeDetailState extends State<NavigateHomeDetail> {
  String? _id;

  @override
  void initState() {
    super.initState();
    Future.microtask(() { // it runs after initState drawing.(it is for ModalRoute)
      final _modelId = ModalRoute.of(context)?.settings.arguments; // it fetchs arguments from navigate_home
      setState(() {
        _id = _modelId is String ? _modelId : widget.id;
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).errorColor,
      appBar: AppBar(
        title: Text(_id ?? ''),
      ),
    );
  }
}
