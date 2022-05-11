import 'package:e_commerce_task1/logic/controllers/auth_controller.dart';
import 'package:e_commerce_task1/logic/controllers/payment_controller.dart';
import 'package:e_commerce_task1/routes/routes.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final TextEditingController _phoneController = TextEditingController();

  int radioContainerIndex = 1;
  bool changeColor = false;

  final _controller = Get.find<PaymentController>();
  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          title: 'Uzay Shop',
          name: 'Uzay store',
          phone: '59-876-5432',
          address: 'Gaza , AL-Remal Street',
          icon: Container(),
          value: 1,
          color: changeColor ? Colors.white : Colors.grey.shade400,
          onChanged: (int? value) {
            setState(() {
              radioContainerIndex = value!;
              changeColor = !changeColor;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () {
            return buildRadioContainer(
              title: 'Delivery',
              name: _authController.displayUserName.value,
              phone: _controller.phoneNumber.value,
              address: _controller.address.value,
              value: 2,
              icon: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Enter Your Phone Number",
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.white,
                    radius: 10,
                    //
                    textCancel: " Cancel ",
                    cancelTextColor: Colors.black,
                    onCancel: () {
                      Get.toNamed(Routes.paymentScreen);
                    },
                    //
                    textConfirm: " Save ",
                    confirmTextColor: Colors.black,
                    onConfirm: () {
                      Get.back();
                      _controller.phoneNumber.value = _phoneController.text;
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                    content: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: _phoneController,
                        cursorColor: Colors.black,
                        maxLength: 9,
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) {
                          _phoneController.text = value;
                        },
                        decoration: InputDecoration(
                          fillColor: Get.isDarkMode
                              ? pinkClr.withOpacity(0.2)
                              : mainColor.withOpacity(0.2),
                          focusColor: Colors.red,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _phoneController.clear();
                            },
                            icon: const Icon(Icons.close, color: Colors.black),
                          ),
                          hintText: "Enter Your Phone Number",
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.contact_phone,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  size: 20,
                ),
              ),
              color: changeColor ? Colors.grey.shade400 : Colors.white,
              onChanged: (int? value) {
                setState(() {
                  radioContainerIndex = value!;
                  changeColor = !changeColor;
                });

                _controller.updatePosition();
              },
            );
          },
        )
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String title,
    required String name,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (int? value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith(
                (states) => Get.isDarkMode ? pinkClr : mainColor),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: name,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text(
                      '🇵🇸+970 ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextUtils(
                      text: phone,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: address,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
