import 'package:e_commerce_task1/logic/controllers/cart_controller.dart';
import 'package:e_commerce_task1/logic/controllers/category_controller.dart';
import 'package:e_commerce_task1/logic/controllers/product_controller.dart';
import 'package:e_commerce_task1/models/product_models.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/screens/product_details_screen.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;

  CategoryItems({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);

  final _cartController = Get.find<CartController>();

  final _controller = Get.find<ProductController>();

  final _categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Obx(
        () {
          if (_categoryController.isAllCategoryLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
            );
          } else {
            return GridView.builder(
              itemCount: _categoryController.categoryList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return buildCardItems(
                  image: _categoryController.categoryList[index].image,
                  price: _categoryController.categoryList[index].price,
                  rate: _categoryController.categoryList[index].rating.rate,
                  productId: _categoryController.categoryList[index].id,
                  productModels: _categoryController.categoryList[index],
                  onTap: () {
                    Get.to(
                      ProductDetailsScreen(
                        productModels: _categoryController.categoryList[index],
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          _controller.manageFavourites(productId);
                        },
                        icon: _controller.isFavourites(productId)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          _cartController.addProductToCart(productModels);
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          // color: Get.isDarkMode ? Colors.white : Colors.black,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                      text: '\$ $price',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      underLine: TextDecoration.none,
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 3, left: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: '$rate',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              underLine: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
