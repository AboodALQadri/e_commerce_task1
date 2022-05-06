import 'package:e_commerce_task1/logic/controllers/category_controller.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/category/category_items.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final _controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (_controller.isCategoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _controller.getCategoryIndex(index);
                    Get.to(
                      CategoryItems(
                        categoryTitle: _controller.categoryNameList[index],
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(_controller.imageCategory[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 20, bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          _controller.categoryNameList[index],
                          style: const TextStyle(
                            backgroundColor: Colors.black38,
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: _controller.categoryNameList.length,
            ),
          );
        }
      },
    );
  }
}
