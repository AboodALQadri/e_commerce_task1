import 'package:e_commerce_task1/view/widgets/category/category_widget.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 15, top: 5, end: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 15, top: 15),
                child: TextUtils(
                  text: 'Category',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
