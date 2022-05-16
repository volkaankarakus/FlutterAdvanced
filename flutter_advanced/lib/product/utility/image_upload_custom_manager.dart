import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class IImageUplaod{
  final ImagePicker picker = ImagePicker();
  Future<XFile?> fetch();
}

class ImageUploadCustomManager{
  final IImageUplaod imageUplaod;

  ImageUploadCustomManager(this.imageUplaod);

  Future<XFile?> cropWithFetch() async{
    return await imageUplaod.fetch();
  }
}

class LibraryImageUpload extends IImageUplaod{
  @override
  Future<XFile?> fetch() async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}

class CameraImageUpload extends IImageUplaod{
  @override
  Future<XFile?> fetch() async{
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }
}