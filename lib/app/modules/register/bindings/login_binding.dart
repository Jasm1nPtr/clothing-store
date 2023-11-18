import 'package:get/get.dart';

import '../controllers/register.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
