import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // Provide http.Client when building ProductController
    Get.lazyPut<ProductController>(
      () => ProductController(httpClient: http.Client()),
    );
  }
}
