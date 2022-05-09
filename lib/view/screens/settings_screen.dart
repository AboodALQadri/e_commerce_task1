import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/setting/dark_mode_widget.dart';
import 'package:e_commerce_task1/view/widgets/setting/language_widget.dart';
import 'package:e_commerce_task1/view/widgets/setting/logout_widget.dart';
import 'package:e_commerce_task1/view/widgets/setting/profile_image.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            ProfileImage(),
            const SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
              color: Get.isDarkMode ? Colors.white : Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
              text: 'GENERAL'.tr,
              color: Get.isDarkMode ? pinkClr : mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              underLine: TextDecoration.none,
            ),
            const SizedBox(
              height: 20,
            ),
            DarkModeWidget(),
            const SizedBox(
              height: 20,
            ),
            LanguageWidget(),
            const SizedBox(
              height: 20,
            ),
            LogOutWidget(),
          ],
        ),
      ),
    );
  }
}
