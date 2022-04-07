import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: TextUtils(
        text: text,
        color:  Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        underLine: TextDecoration.none,
      ),
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ?  mainColor : pinkClr,
        minimumSize: const Size(360, 50),
      ),
    );
  }
}
