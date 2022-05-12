import 'package:image_picker/image_picker.dart';

class ImageUploadManager{
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> fetchFromLibrary() async {
    //Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;

    /*
    //Capture a photo
    final XFile? capturePhotoCamera = await _picker.pickImage(source: ImageSource.camera);

    //Pick a video
    final XFile? pickVideoGallery = await _picker.pickVideo(source: ImageSource.gallery);

    //Capture a video
    final XFile? captureVideoCamera = await _picker.pickVideo(source: ImageSource.camera);

    //Pick multiple images
    final List<XFile>? pickMultipleImages = await _picker.pickMultiImage();

     */
  }
}