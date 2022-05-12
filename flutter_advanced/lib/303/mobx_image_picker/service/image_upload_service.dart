import 'dart:typed_data';

import 'package:dio/dio.dart';

class ImageUploadService{
  final Dio dio;
  // https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com
  // https://firebasestorage.googleapis.com/v0/b/{{image_server}}/o/full%2Fvb.png

  ImageUploadService(this.dio);

  Future<void> uploadToImageServer(Uint8List byteArray, String name) async{  // type is Uint8List for image_picker, and name is what you wanna save filename.

    await dio.post(
      'full%2F$name.png',
      data: byteArray,
      onSendProgress: (int sent,int total) {}
    );
  }
}