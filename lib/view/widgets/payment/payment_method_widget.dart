import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
      child: Column(
        children: [
          buildRadioPayment(
            image: 'assets/images/paypal.png',
            name: 'Paypal',
            scale: 0.7,
            value: 1,
            onChange: (int? value) {
              setState(() {
                radioPaymentIndex = value!;
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          buildRadioPayment(
            image: 'assets/images/google.png',
            name: 'Google Pay',
            scale: 0.8,
            value: 2,
            onChange: (int? value) {
              setState(() {
                radioPaymentIndex = value!;
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          buildRadioPayment(
            image: 'assets/images/credit.png',
            name: 'Credit Card',
            scale: 0.7,
            value: 3,
            onChange: (int? value) {
              setState(() {
                radioPaymentIndex = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              SizedBox(
                width: 10,
              ),
              TextUtils(
                text: name,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                underLine: TextDecoration.none,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            onChanged: (int? value) {
              onChange(value);
            },
            fillColor: MaterialStateColor.resolveWith(
                (states) => Get.isDarkMode ? pinkClr : mainColor),
          ),
        ],
      ),
    );
  }
}
