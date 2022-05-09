import 'package:e_commerce_task1/logic/controllers/auth_controller.dart';
import 'package:e_commerce_task1/logic/controllers/settings_controller.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  final _controller = Get.find<SettingsController>();

  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            return Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        _authController.displayUserPhoto.value,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      text: _controller
                          .capitalize(_authController.displayUserName.value),
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      underLine: TextDecoration.none,
                    ),
                    TextUtils(
                      text: _authController.displayUserEmail.value,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      underLine: TextDecoration.none,
                    ),
                  ],
                )
              ],
            );
          },
        )
      ],
    );
  }
}
