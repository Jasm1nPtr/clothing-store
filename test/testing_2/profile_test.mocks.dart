// Mocks generated by Mockito 5.4.4 from annotations
// in clothing_store_app/test/testing_2/profile_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:image_picker/image_picker.dart' as _i3;
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLostDataResponse_0 extends _i1.SmartFake
    implements _i2.LostDataResponse {
  _FakeLostDataResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ImagePicker].
///
/// See the documentation for Mockito's code generation for more information.
class MockImagePicker extends _i1.Mock implements _i3.ImagePicker {
  MockImagePicker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.XFile?> pickImage({
    required _i2.ImageSource? source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    _i2.CameraDevice? preferredCameraDevice = _i2.CameraDevice.rear,
    bool? requestFullMetadata = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickImage,
          [],
          {
            #source: source,
            #maxWidth: maxWidth,
            #maxHeight: maxHeight,
            #imageQuality: imageQuality,
            #preferredCameraDevice: preferredCameraDevice,
            #requestFullMetadata: requestFullMetadata,
          },
        ),
        returnValue: _i4.Future<_i2.XFile?>.value(),
      ) as _i4.Future<_i2.XFile?>);

  @override
  _i4.Future<List<_i2.XFile>> pickMultiImage({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool? requestFullMetadata = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickMultiImage,
          [],
          {
            #maxWidth: maxWidth,
            #maxHeight: maxHeight,
            #imageQuality: imageQuality,
            #requestFullMetadata: requestFullMetadata,
          },
        ),
        returnValue: _i4.Future<List<_i2.XFile>>.value(<_i2.XFile>[]),
      ) as _i4.Future<List<_i2.XFile>>);

  @override
  _i4.Future<_i2.XFile?> pickMedia({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool? requestFullMetadata = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickMedia,
          [],
          {
            #maxWidth: maxWidth,
            #maxHeight: maxHeight,
            #imageQuality: imageQuality,
            #requestFullMetadata: requestFullMetadata,
          },
        ),
        returnValue: _i4.Future<_i2.XFile?>.value(),
      ) as _i4.Future<_i2.XFile?>);

  @override
  _i4.Future<List<_i2.XFile>> pickMultipleMedia({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool? requestFullMetadata = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickMultipleMedia,
          [],
          {
            #maxWidth: maxWidth,
            #maxHeight: maxHeight,
            #imageQuality: imageQuality,
            #requestFullMetadata: requestFullMetadata,
          },
        ),
        returnValue: _i4.Future<List<_i2.XFile>>.value(<_i2.XFile>[]),
      ) as _i4.Future<List<_i2.XFile>>);

  @override
  _i4.Future<_i2.XFile?> pickVideo({
    required _i2.ImageSource? source,
    _i2.CameraDevice? preferredCameraDevice = _i2.CameraDevice.rear,
    Duration? maxDuration,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickVideo,
          [],
          {
            #source: source,
            #preferredCameraDevice: preferredCameraDevice,
            #maxDuration: maxDuration,
          },
        ),
        returnValue: _i4.Future<_i2.XFile?>.value(),
      ) as _i4.Future<_i2.XFile?>);

  @override
  _i4.Future<_i2.LostDataResponse> retrieveLostData() => (super.noSuchMethod(
        Invocation.method(
          #retrieveLostData,
          [],
        ),
        returnValue:
            _i4.Future<_i2.LostDataResponse>.value(_FakeLostDataResponse_0(
          this,
          Invocation.method(
            #retrieveLostData,
            [],
          ),
        )),
      ) as _i4.Future<_i2.LostDataResponse>);

  @override
  bool supportsImageSource(_i2.ImageSource? source) => (super.noSuchMethod(
        Invocation.method(
          #supportsImageSource,
          [source],
        ),
        returnValue: false,
      ) as bool);
}
