import 'package:e_commerce_task1/logic/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: TextButton(
          onPressed: () {
           ThemesController().changesTheme();
          },
          child: Text(
            'Dark Mode',
            style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
