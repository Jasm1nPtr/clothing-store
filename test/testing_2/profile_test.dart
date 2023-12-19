import 'dart:typed_data';

import 'package:clothing_store_app/app/modules/profilepage/controllers/profilepage_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([ImagePicker])
void main() {
  group('ProfilepageController', () {
    late ProfilepageController profilepageController;
    late MockImagePicker mockImagePicker;

    setUp(() {
      mockImagePicker = MockImagePicker();
      profilepageController =
          ProfilepageController(imagePicker: mockImagePicker);
    });

    test('selectImage should set pickedImage and upIm on successful image pick',
        () async {
      final xFile = XFile('assets/images/profile.png');
      final Uint8List imageBytes = Uint8List.fromList([1, 2, 3]);

      when(mockImagePicker.pickImage(source: anyNamed('source')))
          .thenAnswer((_) async => xFile);
      when(xFile.readAsBytes()).thenAnswer((_) async => imageBytes);

      profilepageController.selectImage(ImageSource.camera);

      expect(profilepageController.pickedImage, equals(xFile));
      expect(profilepageController.upIm, equals(imageBytes));
    });

    test('selectImage should reset pickedImage and upIm on failed image pick',
        () async {
      when(mockImagePicker.pickImage(source: anyNamed('source')))
          .thenThrow('Failed to pick image');

      selectImage(ImageSource.gallery);

      expect(profilepageController.pickedImage, isNull);
      expect(profilepageController.upIm, isNull);
    });

    test('resetImage should reset pickedImage and upIm to null', () {
      profilepageController.pickedImage = XFile('assets/images/profile.png');
      profilepageController.upIm = Uint8List.fromList([1, 2, 3]);

      profilepageController.resetImage();

      expect(profilepageController.pickedImage, isNull);
      expect(profilepageController.upIm, isNull);
    });

    test('your_additional_test_case', () async {
      // Add additional test cases as needed.
    });
  });
}

selectImage(ImageSource gallery) {}
