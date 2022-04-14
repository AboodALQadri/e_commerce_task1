import 'package:e_commerce_task1/logic/controllers/auth_controller.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                controller.checkBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Get.isDarkMode
                        ? const Icon(
                            Icons.done,
                            color: pinkClr,
                          )
                        : Image.asset('assets/images/check.png')
                    : Container(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            TextUtils(
              text: 'I accept ',
              color: Get.isDarkMode ?  Colors.white : Colors.black ,
              fontWeight: FontWeight.normal,
              fontSize: 16,
              underLine: TextDecoration.none,
            ),
            TextUtils(
              text: 'terms & conditions',
              color: Get.isDarkMode ?  Colors.white : Colors.black ,
              fontWeight: FontWeight.normal,
              fontSize: 16,
              underLine: TextDecoration.underline,
            ),
          ],
        );
      },
    );
  }
}
