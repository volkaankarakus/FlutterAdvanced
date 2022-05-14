import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_advanced/303/mobx_image_picker/model/image_upload_response.dart';

class ImageUploadService{
  final Dio dio;
  // https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com
  // https://firebasestorage.googleapis.com/v0/b/{{image_server}}/o/full%2Fvb.png

  ImageUploadService(this.dio);

  Future<ImageUploadResponse?> uploadToImageServer(Uint8List byteArray, String name,{void Function(int, int)? onSendProgress}) async{  // type is Uint8List for image_picker, and name is what you wanna save filename.

    final response = await dio.post(
      'full%2F$name.png',
      data: byteArray,
      onSendProgress: onSendProgress
    );

    if(response.statusCode == HttpStatus.ok){
      return ImageUploadResponse.fromJson(response.data);
    }
    return null;
  }
}