import 'package:e_commerce_task1/logic/controllers/settings_controller.dart';
import 'package:e_commerce_task1/utils/my_string.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);

  final _controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: languageSettings,
                    ),
                    child: const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextUtils(
                    text: 'Language'.tr,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    underLine: TextDecoration.none,
                  ),
                ],
              ),
            ),
            Container(
              width: 120,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  width: 2,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 25,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        english,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: eng,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        arabic,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: arb,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        france,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: fra,
                    ),
                  ],
                  value: _controller.languageLocale,
                  onChanged: (value) {
                    _controller.changeLanguage(value!);
                    Get.updateLocale(Locale(value));
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
