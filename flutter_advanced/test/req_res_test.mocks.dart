// Mocks generated by Mockito 5.1.0 from annotations
// in flutter_advanced/test/req_res_test.dart.
// Do not manually edit this file.

import 'dart:io' as _i5;

import 'package:flutter_advanced/303/mobx_image_picker/model/image_upload_response.dart'
    as _i6;
import 'package:flutter_advanced/303/mobx_image_picker/service/image_upload_service.dart'
    as _i2;
import 'package:flutter_advanced/303/mobx_image_picker/viewModel/image_upload_view_model.dart'
    as _i4;
import 'package:image_picker/image_picker.dart' as _i7;
import 'package:mobx/mobx.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeImageUploadService_0 extends _i1.Fake
    implements _i2.ImageUploadService {}

class _FakeReactiveContext_1 extends _i1.Fake implements _i3.ReactiveContext {}

/// A class which mocks [ImageUploadViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageUploadViewModel extends _i1.Mock
    implements _i4.ImageUploadViewModel {
  MockImageUploadViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set file(_i5.File? _file) =>
      super.noSuchMethod(Invocation.setter(#file, _file),
          returnValueForMissingStub: null);
  @override
  bool get isLoading =>
      (super.noSuchMethod(Invocation.getter(#isLoading), returnValue: false)
          as bool);
  @override
  set isLoading(bool? _isLoading) =>
      super.noSuchMethod(Invocation.setter(#isLoading, _isLoading),
          returnValueForMissingStub: null);
  @override
  String get downloadText =>
      (super.noSuchMethod(Invocation.getter(#downloadText), returnValue: '')
          as String);
  @override
  set downloadText(String? _downloadText) =>
      super.noSuchMethod(Invocation.setter(#downloadText, _downloadText),
          returnValueForMissingStub: null);
  @override
  String get imageUrl =>
      (super.noSuchMethod(Invocation.getter(#imageUrl), returnValue: '')
          as String);
  @override
  set imageUrl(String? _imageUrl) =>
      super.noSuchMethod(Invocation.setter(#imageUrl, _imageUrl),
          returnValueForMissingStub: null);
  @override
  _i2.ImageUploadService get imageUploadService =>
      (super.noSuchMethod(Invocation.getter(#imageUploadService),
          returnValue: _FakeImageUploadService_0()) as _i2.ImageUploadService);
  @override
  set imageUploadService(_i2.ImageUploadService? _imageUploadService) => super
      .noSuchMethod(Invocation.setter(#imageUploadService, _imageUploadService),
          returnValueForMissingStub: null);
  @override
  _i3.ReactiveContext get context =>
      (super.noSuchMethod(Invocation.getter(#context),
          returnValue: _FakeReactiveContext_1()) as _i3.ReactiveContext);
  @override
  void changeLoading() =>
      super.noSuchMethod(Invocation.method(#changeLoading, []),
          returnValueForMissingStub: null);
  @override
  void updateDownloadText(int? send, int? total) =>
      super.noSuchMethod(Invocation.method(#updateDownloadText, [send, total]),
          returnValueForMissingStub: null);
  @override
  void uploadImageUrl(_i6.ImageUploadResponse? response) =>
      super.noSuchMethod(Invocation.method(#uploadImageUrl, [response]),
          returnValueForMissingStub: null);
  @override
  void init() => super.noSuchMethod(Invocation.method(#init, []),
      returnValueForMissingStub: null);
  @override
  void saveLocalFile(_i7.XFile? file) =>
      super.noSuchMethod(Invocation.method(#saveLocalFile, [file]),
          returnValueForMissingStub: null);
  @override
  void saveDataToService() =>
      super.noSuchMethod(Invocation.method(#saveDataToService, []),
          returnValueForMissingStub: null);
}
