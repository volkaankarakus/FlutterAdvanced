import 'package:flutter/material.dart';
import 'package:flutter_advanced/product/utility/image_upload_custom_manager.dart';
import 'package:flutter_advanced/product/utility/image_upload_manager.dart';

class ImagePickerGenericView extends StatefulWidget {
  const ImagePickerGenericView({Key? key}) : super(key: key);

  @override
  State<ImagePickerGenericView> createState() => _ImagePickerGenericViewState();
}

class _ImagePickerGenericViewState extends State<ImagePickerGenericView> {
  final _imageUploadManager = ImageUploadManager();
  late final ImageUploadCustomManager _imageUploadCustomManager;

  @override
  void initState() {
    super.initState();
    _imageUploadCustomManager = ImageUploadCustomManager(LibraryImageUpload());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            _imageUploadCustomManager.cropWithFetch();
          },
              child: Text('Fetch from gallery')),
          ElevatedButton(onPressed: (){}, child: Text('Fetch from normal')),
          ElevatedButton(onPressed: (){}, child: Text('Fetch from multiple')),


        ],
      ),
    );
  }
}



