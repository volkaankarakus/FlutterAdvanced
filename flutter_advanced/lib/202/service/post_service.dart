import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced/202/service/post_model.dart';


// template
abstract class IPostService{
  Future<bool> _addItemToService(PostModel postModel);
  Future<List<PostModel>?> fetchItemsAdvanced();
  Future<bool> _putItemToService(PostModel postModel,int id);
  Future<bool> _deleteItemToService(PostModel postModel,int id);
}


class PostServices implements IPostService{

  final Dio _networkManager;

  PostServices() : _networkManager = Dio(
      BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));


  @override
  Future<bool> _addItemToService(PostModel postModel) async{
    try{
      final response = await _networkManager.post(
          _PostServicePaths.posts.name,
          data: postModel);
      return response.statusCode == HttpStatus.created;
    }on DioError catch(exception){
      _ShowDebugError.showDioError(exception);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchItemsAdvanced() async{
    try{
      final response = await _networkManager.get(_PostServicePaths.posts.name);
      // print(response);

      if(response.statusCode == HttpStatus.ok){
        final _datas = response.data;
        if(_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }else{
        return null;
      }
    }on DioError catch(exception){
      _ShowDebugError.showDioError(exception);
    }
  }

  @override
  Future<bool> _putItemToService(PostModel postModel,int id) async{
    try{
      final response = await _networkManager.put(
          '${_PostServicePaths.posts.name}/$id',
          data: postModel);

      return response.statusCode == HttpStatus.ok;

    }on DioError catch(exception){
      _ShowDebugError.showDioError(exception);
    }
    return false;
  }

  @override
  Future<bool> _deleteItemToService(PostModel postModel,int id) async{
    try{
      final response = await _networkManager.put(
          '${_PostServicePaths.posts.name}/$id');

      return response.statusCode == HttpStatus.ok;

    }on DioError catch(exception){
      _ShowDebugError.showDioError(exception);
    }
    return false;
  }
}

class _ShowDebugError{
  static void showDioError(DioError error){
    if(kDebugMode){
      print(error.message);
    }
  }
}

enum _PostServicePaths{
  posts,comments
}