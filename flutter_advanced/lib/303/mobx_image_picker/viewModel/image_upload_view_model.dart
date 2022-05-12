import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_view_model.g.dart';

// ON TERMINAL -> flutter pub run build_runner build

class ImageUploadViewModel = _ImageUploadViewModelBase with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store{
  @observable
  File? file;

  @observable
  bool isLoading = false;

  @action
  void changeLoading(){
    isLoading = !isLoading;
  }

  void init(){

  }

  @action
  void saveLocalFile(XFile? file){
    if(file == null) return;
    this.file = File(file.path);
  }

}