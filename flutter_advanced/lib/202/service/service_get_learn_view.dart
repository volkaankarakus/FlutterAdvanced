import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/202/service/post_model.dart';
import 'package:flutter_advanced/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _networkManager; // It is not correct to create a Dio for each request.
                                    // networkRequest must consist of an instance.
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  late final IPostService _postServices; // now it can be testable with IPostService(template class)


  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    _postServices = PostServices();
    fetchItemsAdvanced();
  }

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItems() async{
    _changeLoading();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    // print(response);

    if(response.statusCode == HttpStatus.ok){
      final _datas = response.data;
      if(_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList() ; // adapting _datas to _items with map
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchItemsAdvanced() async{
    _changeLoading();
    _items = await _postServices.fetchItemsAdvanced();
    _changeLoading();
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
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _PostCard(model: _items?[index]);
        },
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
