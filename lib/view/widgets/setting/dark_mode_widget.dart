import 'package:e_commerce_task1/logic/controllers/settings_controller.dart';
import 'package:e_commerce_task1/logic/controllers/theme_controller.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);

  final _controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
              activeColor: Get.isDarkMode ? pinkClr : mainColor,
              activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
              value: _controller.switchValue.value,
              onChanged: (value) {
                ThemesController().changesTheme();
                _controller.switchValue.value = value;
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsetsDirectional.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            text: 'Dark Mode'.tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            underLine: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
