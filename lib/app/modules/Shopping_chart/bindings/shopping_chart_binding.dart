import 'package:get/get.dart';

import '../controllers/shopping_chart_controller.dart';

class ShoppingChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingChartController>(
      () => ShoppingChartController(),
    );
  }
}
