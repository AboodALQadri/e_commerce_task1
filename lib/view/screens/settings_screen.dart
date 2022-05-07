import 'package:e_commerce_task1/logic/controllers/auth_controller.dart';
import 'package:e_commerce_task1/logic/controllers/theme_controller.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/setting/dark_mode_widget.dart';
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
            // ProfileImage(),
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
              text: 'GENERAL',
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
            // LanguageWidget(),
            const SizedBox(
              height: 20,
            ),
            // LogOutWidget(),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           ThemesController().changesTheme();
      //         },
      //         child: Text(
      //           'Dark Mode',
      //           style: TextStyle(
      //             color: Get.isDarkMode ? Colors.white : Colors.black,
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       GetBuilder<AuthController>(
      //         builder: (_) {
      //           return TextButton(
      //             onPressed: () {
      //               Get.defaultDialog(
      //                 backgroundColor: Colors.grey,
      //                 title: 'Logout From App',
      //                 titleStyle: const TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //                 middleText: 'Are you Sure you want to Logout ? ',
      //                 middleTextStyle: const TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //                 radius: 10,
      //                 textCancel: 'NO',
      //                 cancelTextColor: Colors.white,
      //                 onCancel: () {
      //                   Get.back();
      //                 },
      //                 textConfirm: 'YES',
      //                 confirmTextColor: Colors.white,
      //                 onConfirm: () {
      //                   _.signOutFromApp();
      //                 },
      //                 buttonColor: Get.isDarkMode ? pinkClr : mainColor,
      //               );
      //             },
      //             child: Text(
      //               'LogOut',
      //               style: TextStyle(
      //                 color: Get.isDarkMode ? Colors.white : Colors.black,
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
