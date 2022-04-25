import 'package:e_commerce_task1/logic/controllers/cart_controller.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/cart/cart_product_cart.dart';
import 'package:e_commerce_task1/view/widgets/cart/cart_total.dart';
import 'package:e_commerce_task1/view/widgets/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final _controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('Cart Items'),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                _controller.clearAllProducts();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx(
          () {
            if (_controller.productsMap.isEmpty) {
              return EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 550,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            productModels:
                                _controller.productsMap.keys.toList()[index],
                            index: index,
                            quantity:
                                _controller.productsMap.values.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: _controller.productsMap.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 30),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
