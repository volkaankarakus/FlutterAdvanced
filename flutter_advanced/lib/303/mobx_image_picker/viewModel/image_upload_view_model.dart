import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_advanced/303/mobx_image_picker/model/image_upload_response.dart';
import 'package:flutter_advanced/303/mobx_image_picker/service/image_upload_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_view_model.g.dart';

// ON TERMINAL -> flutter pub run build_runner build

class ImageUploadViewModel = _ImageUploadViewModelBase with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store{
  static const _baseUrl =  "https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/";

  @observable // observable will be listen on screen
  File? file;

  @observable // observable will be listen on screen
  bool isLoading = false;

  @observable
  String downloadText = '';

  @observable
  String imageUrl = '';

  ImageUploadService imageUploadService = ImageUploadService(Dio(BaseOptions(baseUrl: _baseUrl)));


  @action // action will notify the screen
  void changeLoading(){
    isLoading = !isLoading;
  }

  @action
  void updateDownloadText(int send,int total){
    downloadText = '$send / $total';
  }

  @action
  void uploadImageUrl(ImageUploadResponse? response){
    if (response == null) return;
    imageUrl = 'https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/' + (response.name?.replaceFirst('/','%2F') ?? '');
  }

  void init(){

  }

  @action // action will notify the screen
  void saveLocalFile(XFile? file){
    if(file == null) return;
    this.file = File(file.path);
  }

  @action
  bool? saveLocalFileTest(XFile? file){
    this.file = File(file?.path ?? '');
    return file?.path.isNotEmpty;
  }

  void saveDataToService()async{
    if(file == null) return;
    changeLoading();
    final response = await imageUploadService.uploadToImageServer(
        await file!.readAsBytes(),
        'Vk',
        onSendProgress: (sent,total){
          updateDownloadText(sent, total);
    });
    uploadImageUrl(response);
  }

}