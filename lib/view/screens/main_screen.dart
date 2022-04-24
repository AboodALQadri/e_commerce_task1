import 'package:e_commerce_task1/logic/controllers/main_controller.dart';
import 'package:e_commerce_task1/routes/routes.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final _controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: Text(
                _controller.title[_controller.currentIndex.value],
                style: const TextStyle(color: Colors.white),
              ),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  icon: Image.asset('assets/images/shop.png'),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              currentIndex: _controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                _controller.currentIndex.value = index;
              },
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.home_outlined,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.category_outlined,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                ),
              ],
            ),
            body: IndexedStack(
              index: _controller.currentIndex.value,
              children: _controller.tabs.value,
            ),
          );
        },
      ),
    );
  }
}
