import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced/202/service/comment_model.dart';
import 'package:flutter_advanced/202/service/post_model.dart';


// template
abstract class IPostService{
  Future<bool> _addItemToService(PostModel postModel);
  Future<List<PostModel>?> fetchItemsAdvanced();
  Future<bool> _putItemToService(PostModel postModel,int id);
  Future<bool> _deleteItemToService(PostModel postModel,int id);
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
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
      _ShowDebugError.showDioError(exception,this);
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
      _ShowDebugError.showDioError(exception,this);
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
      _ShowDebugError.showDioError(exception,this);
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
      _ShowDebugError.showDioError(exception,this);
    }
    return false;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try{
      final response = await _networkManager.get(_PostServicePaths.comments.name,
      queryParameters: {_PostQueryPaths.postId.name : postId});
      if(response.statusCode == HttpStatus.ok){
        final _datas = response.data;
        if(_datas is List){
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    }on DioError catch(exception){
      _ShowDebugError.showDioError(exception,this);
    }
  }
}

class _ShowDebugError{
  static void showDioError<T>(DioError error,T type){
    if(kDebugMode){
      print(error.message);
      print(type);
      print('---------');
    }
  }
}

enum _PostServicePaths{posts,comments}

enum _PostQueryPaths{postId,}