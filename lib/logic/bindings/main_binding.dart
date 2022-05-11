import 'package:e_commerce_task1/logic/controllers/main_controller.dart';
import 'package:e_commerce_task1/logic/controllers/payment_controller.dart';
import 'package:e_commerce_task1/logic/controllers/settings_controller.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(PaymentController() , permanent: true);
  }
}
