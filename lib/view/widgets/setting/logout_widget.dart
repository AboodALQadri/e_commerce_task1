import 'package:e_commerce_task1/logic/controllers/auth_controller.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);

  final _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
              backgroundColor: Colors.grey,
              title: 'Logout From App',
              titleStyle: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              middleText: 'Are you Sure you want to Logout ? ',
              middleTextStyle: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              radius: 10,
              textCancel: 'NO',
              cancelTextColor: Colors.white,
              onCancel: () {
                Get.back();
              },
              textConfirm: 'YES',
              confirmTextColor: Colors.white,
              onConfirm: () {
                _controller.signOutFromApp();
              },
              buttonColor: Get.isDarkMode ? pinkClr : mainColor,
            );
          },
          splashColor: Get.isDarkMode
              ? pinkClr.withOpacity(0.4)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsetsDirectional.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                text: 'Logout'.tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                underLine: TextDecoration.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
