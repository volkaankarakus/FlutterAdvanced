import 'dart:io';

import 'package:flutter_advanced/303/mobx_image_picker/viewModel/image_upload_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';

import 'req_res_test.mocks.dart';


@GenerateMocks([ImageUploadViewModel])
void main(){
  setUp((){
  });
  test('saveLocalFileTest - Test',(){
    var mockUpload = MockImageUploadViewModel();
    XFile? file;
    final result = mockUpload.saveLocalFileTest(file);

    expect(result,true);
  });
}

