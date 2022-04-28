import 'package:e_commerce_task1/logic/controllers/cart_controller.dart';
import 'package:e_commerce_task1/models/product_models.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;

  AddCart({
    Key? key,
    required this.price,
    required this.productModels,
  }) : super(key: key);

  final _controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(25),
      child: Row(
        children: [
          Column(
            children: [
              TextUtils(
                text: 'Price',
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                underLine: TextDecoration.none,
              ),
              Text(
                '\$$price',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                ),
                onPressed: () {
                  _controller.addProductToCart(productModels);
                  Get.snackbar(
                    'Verify',
                    'Add to Cart SUCCESSFULLY',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart_outlined),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
