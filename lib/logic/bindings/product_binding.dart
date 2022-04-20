import 'package:e_commerce_task1/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
