import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {

  bool _isLoading = false;
  late final Dio _networkManager; // It is not correct to create a Dio for each request.
  // networkRequest must consist of an instance.
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();

  Future<void> _addItemToService(PostModel postModel) async{
    _changeLoading();
    final response = await _networkManager.post('posts', data: postModel);
    if(response.statusCode == HttpStatus.created){

    }
    _changeLoading();
  }


  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        actions: [
          _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Title'),),
          TextField(
            controller: _bodyController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Body'),),
          TextField(
            controller: _userIdController,
            autofillHints: [AutofillHints.creditCardNumber],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'UserId'),
          ),
          TextButton(
              onPressed: (){
                _isLoading ? null : () {
                  if(_titleController.text.isNotEmpty
                  && _bodyController.text.isNotEmpty
                  && _userIdController.text.isNotEmpty) {
                    final model = PostModel(
                        title: _titleController.text,
                        body: _bodyController.text,
                        userId: int.tryParse(_userIdController.text));

                    _addItemToService(model);
                  }
                };
              },
              child: Text('Send')
          )
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  }) : _model = model, super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
