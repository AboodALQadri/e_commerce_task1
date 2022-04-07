import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Get.isDarkMode
                ? Image.asset('assets/images/check.png')
                : const Icon(
                    Icons.done,
                    color: pinkClr,
                    size: 30,
                  ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        TextUtils(
          text: 'I accept ',
          color: Get.isDarkMode ?  Colors.black : Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          underLine: TextDecoration.none,
        ),
        TextUtils(
          text: 'terms & conditions',
          color: Get.isDarkMode ?  Colors.black : Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          underLine: TextDecoration.underline,
        ),
      ],
    );
  }
}
