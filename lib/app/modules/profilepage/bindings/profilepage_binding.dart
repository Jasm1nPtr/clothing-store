// bindings/profilepage_binding.dart

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profilepage_controller.dart';

class ProfilepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilepageController>(
      () => ProfilepageController(imagePicker: ImagePicker()),
    );
  }
}
