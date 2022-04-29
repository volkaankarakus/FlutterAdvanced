import 'package:flutter/material.dart';
import 'package:flutter_advanced/202/animated_learn_view.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePaths.image_collection.toWidget(height: 40),
    );
  }
}

enum ImagePaths {
  image_collection
}

extension ImagePathsExtension on ImagePaths{
  String path(){
    return 'assets/png/$name/png';
  }

  Widget toWidget({height = 24}){
    return Image.asset(path(),height: height );
  }
}

