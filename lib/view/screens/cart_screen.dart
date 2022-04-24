import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
              onPressed: () {},
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: EmptyCart(),
      ),
    );
  }
}
