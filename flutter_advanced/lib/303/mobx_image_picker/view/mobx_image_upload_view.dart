import 'package:flutter/material.dart';
import 'package:flutter_advanced/303/mobx_image_picker/viewModel/image_upload_view_model.dart';
import 'package:flutter_advanced/product/utility/image_upload_manager.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({Key? key}) : super(key: key);

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final String _imageUploadLottiePath = "https://assets7.lottiefiles.com/packages/lf20_urbk83vw.json";

  final _imageUploadViewModel = ImageUploadViewModel();
  final _imageUploadManager = ImageUploadManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload'),
        actions: [
          Observer(
              builder: (_){
                return _imageUploadViewModel.isLoading ?  CircularProgressIndicator() : SizedBox();
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Card(
              elevation: 10,
              child: Row(
                  children :[
                    Expanded(
                      child: Observer(
                        builder: (context) {
                          return _imageUploadViewModel.file != null ? Image.file(_imageUploadViewModel.file!) : SizedBox();
                        },
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        child: IconButton(
                          icon: Lottie.network(_imageUploadLottiePath),
                          onPressed: () async{
                            _imageUploadViewModel.saveLocalFile(await _imageUploadManager.fetchFromLibrary());
                          },
                        ),
                      ),
                    )
                  ], )
            ),
          ),
          Divider(),
          Expanded(
              flex: 4,
              child: SizedBox()),
        ],
      ),
    );
  }
}
