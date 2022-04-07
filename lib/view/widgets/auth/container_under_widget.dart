import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnderWidget extends StatelessWidget {
  const ContainerUnderWidget({
    Key? key,
    required this.text,
    required this.textType,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final String textType;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration:  BoxDecoration(
        color:  Get.isDarkMode ?  mainColor : pinkClr,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            underLine: TextDecoration.none,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              text: textType,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              underLine: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
